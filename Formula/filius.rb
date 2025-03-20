class Filius < Formula
  desc "Network simulator for educational purposes"
  homepage "https://www.lernsoftware-filius.de"
  head "https://gitlab.com/filius1/filius.git", branch: "master"

  depends_on "java"
  depends_on "maven"

  def install
    system "mvn", "clean", "package"
    libexec.install "target/filius.sh"
    bin.write_exec_script libexec/"filius"
  end

  def caveats
    <<~EOS
      Filius has been installed. To run it, use:
        filius
    EOS
  end
end
