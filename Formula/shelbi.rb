class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  version "0.3.1"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.3.1/shelbi_Darwin_arm64.tar.gz"
      sha256 "70525c68ce66b66fe0896c957a58004d9f1acf56d291d4c5f874d1d62a78eb39"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.3.1/shelbi_Darwin_x86_64.tar.gz"
      sha256 "453673fcbd799650327e7b4c932f6ce8e57c9b090729d1dd67cb130f2c65ff59"
    end
  end

  def install
    bin.install "shelbi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shelbi --version")
  end
end
