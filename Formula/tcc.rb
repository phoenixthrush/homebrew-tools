class Tcc < Formula
  desc "Tiny C Compiler for x86, x86-64, and ARM"
  homepage "https://bellard.org/tcc/"
  license "LGPL-2.0-or-later"
  revision 1
  head "https://repo.or.cz/tinycc.git", branch: "mob"

  def install
    os_include_path = if OS.mac?
      MacOS.sdk_path/"usr/include"
    else
      "/usr/include:/usr/include/x86_64-linux-gnu"
    end

    args = %W[
      --prefix=#{prefix}
      --source-path=#{buildpath}
      --sysincludepaths=#{HOMEBREW_PREFIX}/include:#{os_include_path}:{B}/include
      --enable-cross
    ]

    args << "--cc=#{ENV.cc}" if build.head?

    ENV.deparallelize
    system "./configure", *args

    system "make"
    system "make test"
    system "make", "install"
  end
end