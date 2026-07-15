class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  version "0.5.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.5.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "94a822dbca95cbcbc4c298851f14955e6acb0d55e0684f63f3b214c2b5139462"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.5.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "e1fcd458e257ad1473cd6176969538a3f6088800a907819469ffbfc728aa7e9a"
    end
  end

  def install
    bin.install "shelbi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shelbi --version")
  end
end
