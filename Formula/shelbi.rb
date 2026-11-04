class Shelbi < Formula
  desc "Open-source agent orchestrator for parallel coding agents"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.13.3/shelbi_Darwin_arm64.tar.gz"
      sha256 "b3163a5fe59ce5e50962b87194feedb82ae2a2442aade726bacbe0066fa6845d"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.13.3/shelbi_Darwin_x86_64.tar.gz"
      sha256 "956ed812ec79e096577946c2e918099f3b2bddd28da80ef76d84699675075c72"
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
