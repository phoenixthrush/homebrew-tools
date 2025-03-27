class Tcc < Formula
  desc "Tiny C Compiler for x86, x86-64, and ARM"
  homepage "https://bellard.org/tcc/"
  license "LGPL-2.0-or-later"
  revision 1
  head "https://repo.or.cz/tinycc.git", branch: "mob"

  def install
    # os_include_path = if OS.mac?
    #   MacOS.sdk_path/"usr/include"
    # else
    #   "/usr/include:/usr/include/x86_64-linux-gnu"
    # end

    # args = %W[
    #   --prefix=#{prefix}
    #   --source-path=#{buildpath}
    #   --sysincludepaths=#{HOMEBREW_PREFIX}/include:#{os_include_path}:{B}/include
    #   --enable-cross
    # ]

    # ENV.deparallelize
    system "./configure"
    inreplace "config.mak", "../../super/cc", "clang"
    # inreplace "config.mak", "/usr/local/lib", "#{lib}"

    system "make"
    # system "make", "test"
    # system "make", "install"

    bin.install Dir["tcc", "*-tcc"]
    (lib/"tcc").install Dir["libtcc1.a", "runmain.o", "bt-exe.o", "bt-log.o", "bcheck.o", "*-libtcc1.a"]
    (lib/"tcc/include").install Dir["include/*.h", "tcclib.h"]
    lib.install Dir["libtcc.a", "*.so"]
    include.install "libtcc.h"
    man1.install Dir["tcc.1"]

    if Dir.exist?("win32")
      (lib/"tcc/win32/lib").install Dir["win32/lib/*.def", "*-win32-libtcc1.a", "*-wince-libtcc1.a"]
      (lib/"tcc/win32/include").install Dir["win32/include/*", "include/*.h", "tcclib.h"]
    end

    test do
      (testpath/"test.c").write <<~C
        #include <stdio.h>
        int main()
        {
          puts("Hello, world!");
          return 0;
        }
      C
      assert_equal "Hello, world!\n", shell_output("#{bin}/tcc -run test.c")
    end
  end

  def caveats
    <<~EOS
      To use tcc, you may need to set the following environment variables:

        export LIBRARY_PATH="#{opt_lib}/tcc"

      If you're using macOS, also consider adding this to your shell configuration file:
      
        echo 'export LIBRARY_PATH="#{opt_lib}/tcc"' >> ~/.zshrc
        source ~/.zshrc
    EOS
  end
end