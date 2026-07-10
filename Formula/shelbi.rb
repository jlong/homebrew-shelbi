class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  version "0.3.2"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.3.2/shelbi_Darwin_arm64.tar.gz"
      sha256 "778f7dff799b784648c85e0bbe4ea125a333596c220938109f4473eab2b49cc4"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.3.2/shelbi_Darwin_x86_64.tar.gz"
      sha256 "84c6fe782dc5ba0940c0b71e0be4a7ca8577f967fb8206f302f71f8607b2d0cf"
    end
  end

  def install
    bin.install "shelbi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shelbi --version")
  end
end
