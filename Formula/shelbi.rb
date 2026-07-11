class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  version "0.4.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.4.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "54cf9ead466e0341f58d13a39b45875eaa2304156afdc80986eced09bf4b7a7b"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.4.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "0079239eb87adaaefb88fd66c631ffd3d3c95c7c74b8ad77aa96e269c8537ffc"
    end
  end

  def install
    bin.install "shelbi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shelbi --version")
  end
end
