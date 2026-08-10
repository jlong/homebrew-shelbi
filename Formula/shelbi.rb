class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.8.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "ba0af12631b70428f7f7029c07116caf8aaf21726199841f3668007868e5c58e"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.8.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "a1b2c9e66254d5176649d1a721be12efc44ca8f23e5d27d4d1df1db02ae4358d"
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
