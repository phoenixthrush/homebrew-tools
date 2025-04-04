class Filius < Formula
  desc "Filius is a network simulator for educational purpose"
  homepage "https://www.lernsoftware-filius.de"
  head "https://gitlab.com/filius1/filius.git", branch: "master"
  license any_of: ["GPL-2.0-or-later", "GPL-3.0-or-later"]

  # hope it works lol
  unless system("which java > /dev/null 2>&1")
    depends_on "java"
  end

  depends_on "maven"

  def install
    system "mvn", "clean", "package", "-DskipTests"
    
    libexec.install Dir["target"]
    # bin.write_jar_script libexec/"target/filius.jar", "filius"

    # TODO: this currently suppresses stdout completely, including the help section...
    (bin/"filius").write <<~EOS
      #!/usr/bin/env bash
      exec java -jar #{libexec}/target/filius.jar "$@" > /dev/null
    EOS
  end
end
