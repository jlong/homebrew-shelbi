class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  version "0.1.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.1.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "511d2d702f6919860b37457734963674787b1bb416633403513a16f6d3ecd5f2"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.1.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "ab0e2fabf10014e451e4315e2d148294ab0eb5294a99611104694e8862df271a"
    end
  end

  def install
    bin.install "shelbi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shelbi --version")
  end
end
