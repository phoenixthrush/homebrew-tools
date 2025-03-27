class Johnny < Formula
  desc "Johnny is a simulator of a simple (virtual) von-Neumann Computer"
  homepage "https://github.com/TobisMa/johnny"
  head "https://github.com/TobisMa/johnny.git", branch: "master"
  license "AGPL-3.0-or-later"

  def install
    prefix.install Dir["*"]

    # maybe build webview johnny in future
    (bin/"johnny").write <<~EOS
      #!/usr/bin/env bash
      open "#{prefix}/index.html"
    EOS
  end
end