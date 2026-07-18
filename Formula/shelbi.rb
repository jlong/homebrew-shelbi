class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  version "0.6.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.6.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "18248ab0e7e0dbe081c362018577ece6610dab92d520928cc384f55285deccee"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.6.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "44f924c38244bc00e65e0a72ae5b85babd3a51c882ba21bf73cbc2a9198daea7"
    end
  end

  def install
    bin.install "shelbi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shelbi --version")
  end
end
