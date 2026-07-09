class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  version "0.3.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.3.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "6b4c92c68a991ec2de9fcba830692c9a5eb0974422ff4abb9b0c91fb4057e59b"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.3.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "458bd9c99300fa84b4a6ab87aeb0d61df15d7f8ab48d93f20ea7dc8e42aaf33f"
    end
  end

  def install
    bin.install "shelbi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shelbi --version")
  end
end
