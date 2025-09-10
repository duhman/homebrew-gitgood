class Gitgood < Formula
  desc "Interactive Git learning experience for the terminal"
  homepage "https://github.com/duhman/gitgood-cli"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.3/gitgood-cli-v0.1.3-macos-x64.tar.gz"
      sha256 "39530dd194d8672baeef7340cd4d6740179b473394047817c50eb842bdea0096"
    end
    on_arm do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.3/gitgood-cli-v0.1.3-macos-arm64.tar.gz"
      sha256 "123f75dcef62df9aa8179bea3eea301404ab836d6fbecf9ef9e55e3da55a3f0a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.3/gitgood-cli-v0.1.3-linux-x64.tar.gz"
      sha256 "1e00fa301108c60ee7623d76667c87c1a241a6526430f24299ed401c615705e0"
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
