class Gitgood < Formula
  desc "Interactive Git learning experience for the terminal"
  homepage "https://github.com/duhman/gitgood-cli"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.2/gitgood-cli-v0.1.2-macos-x64.tar.gz"
      sha256 "cb00db5eab9753d30212fdfd5203c7203a0e9c22bb3c870495a75c8e9c848515"
    end
    on_arm do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.2/gitgood-cli-v0.1.2-macos-arm64.tar.gz"
      sha256 "85e313f832567b7d8535d5445259503bdd37eaed4bc34feb12083698fb7fc7fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.2/gitgood-cli-v0.1.2-linux-x64.tar.gz"
      sha256 "39429e5ba2c2c977168f1491089e07e69b31537716df33a34997f8e8202c8727"
    end
  end

  def install
    libexec.install Dir["*"]
    (bin/"gitgood").write <<~EOS
      #!/bin/bash
      exec node "#{libexec}/dist/index.js" "$@"
    EOS
    (bin/"gitgood").chmod 0755
  end

  test do
    system "#{bin}/gitgood", "--version"
  end
end
