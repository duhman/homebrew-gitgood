class Gitgood < Formula
  desc "Interactive Git learning experience for the terminal"
  homepage "https://github.com/duhman/gitgood-cli"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.0/gitgood-cli-v0.1.0-macos-x64.tar.gz"
      sha256 "258adef1071b9fb740975eefcee7baccfa408070c1698d44d301d622a4b00538"
    end
    on_arm do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.0/gitgood-cli-v0.1.0-macos-arm64.tar.gz"
      sha256 "5f30e90d3486f419d695dd1b9b607347a290b548da2bfe447873a0cf9e89c4fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/duhman/gitgood-cli/releases/download/v0.1.0/gitgood-cli-v0.1.0-linux-x64.tar.gz"
      sha256 "b34202fb994e3906b23b7f3c273cdd26af27eaba13b92b7ad2d0fadb8def2c93"
    end
  end

  def install
    bin.install "gitgood"
  end

  test do
    system "#{bin}/gitgood", "--version"
  end
end
