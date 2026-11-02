class Shelbi < Formula
  desc "Open-source agent orchestrator for parallel coding agents"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.13.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "079e3097437ae1998bb044e1003abd86e043ff2044ecfa82a1af52c228a1cca7"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.13.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "292fb57733679e0e164450c0087e1720a3f0addbf7129c2207dad20b4d14f842"
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
