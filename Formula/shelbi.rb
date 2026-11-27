class Shelbi < Formula
  desc "Open-source agent orchestrator for parallel coding agents"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.15.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "88f341c09abd1781c3ae16c756079e6bcc0c5d3c3e945d61cdf76f0a9a4c478c"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.15.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "4f290cb9b9a5c0753097f089d69cf47a0cbde6677dcc8fddd7bdca91b9bd951b"
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
    assert_path_exists pkgshare/"plugins/shelbi-awareness/.claude-plugin/plugin.json"
    assert_path_exists pkgshare/"plugins/shelbi-awareness/hooks/hooks.json"
    assert_path_exists pkgshare/"plugins/shelbi-awareness/monitors/monitors.json"
  end
end
