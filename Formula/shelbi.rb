class Shelbi < Formula
  desc "Open-source agent orchestrator for parallel coding agents"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.14.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "14249f6d47d9150a006423a9045a08f3ab9d95c99ed946c022d076a70e0700c1"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.14.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "ed911679431ab99f53b3f77534ac4fc3fdd91bbf58720d229071b8225321f70d"
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
