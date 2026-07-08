class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  version "0.2.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.2.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "1ef16738fca8db33357d1996ea357a8dcac1bcb699879a1615e82ffa4f483f72"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.2.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "c7022915443d7b56317019566f62866fbe2e6df8544a6d365fb43dce96e7e9cc"
    end
  end

  def install
    bin.install "shelbi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shelbi --version")
  end
end
