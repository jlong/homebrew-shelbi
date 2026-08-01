class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  version "0.7.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.7.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "803c7d98a37537c8dac756efd652ff10f0681ad9d2546796d0c262e13d8549f1"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.7.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "974ae9467140dcfee742f8ff060a6c45497cb3f48a8b977535aae74a4a3d5895"
    end
  end

  def install
    bin.install "shelbi"
    pkgshare.install "plugins"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shelbi --version")
    assert_path_exists pkgshare/"plugins/update-shelbi-configuration/.claude-plugin/plugin.json"
    assert_path_exists pkgshare/"plugins/update-shelbi-configuration/.codex-plugin/plugin.json"
    assert_path_exists pkgshare/"plugins/update-shelbi-configuration/skills/update-shelbi-configuration/SKILL.md"
  end
end
