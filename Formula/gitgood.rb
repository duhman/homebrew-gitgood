class Gitgood < Formula
  desc "Interactive Git learning experience for the terminal"
  homepage "https://github.com/duhman/gitgood-cli"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.1/gitgood-cli-v0.1.1-macos-x64.tar.gz"
      sha256 "63708712867f080fde8d3263de4e65a2418d1ce2d4842345a7fc745d94c3c84e"
    end
    on_arm do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.1/gitgood-cli-v0.1.1-macos-arm64.tar.gz"
      sha256 "236391d68c4d991a17aeb32a68c81aa502864687362d609376750afc8f2f1b6d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.1/gitgood-cli-v0.1.1-linux-x64.tar.gz"
      sha256 "39422d91cfc3a83f7646e57ec00e2cf317c25734c9ccea519482d5b305059ae8"
    end
  end

  def install
    libexec.install Dir["*"]
    (bin/"gitgood").write <<~EOS
      #!/bin/bash
      exec node "{libexec}/dist/index.js" "$@"
    EOS
    (bin/"gitgood").chmod 0755
  end

  test do
    system "{bin}/gitgood", "--version"
  end
end
