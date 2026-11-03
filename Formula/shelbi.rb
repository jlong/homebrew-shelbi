class Shelbi < Formula
  desc "Open-source agent orchestrator for parallel coding agents"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.13.2/shelbi_Darwin_arm64.tar.gz"
      sha256 "0d16dbb8b60c23725b5c48d80f3897ed2d3722c8a9084a2c1c07096b64adda14"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.13.2/shelbi_Darwin_x86_64.tar.gz"
      sha256 "035302fb690e11be6a7b5f6364b217d5bebbe0eb32baed133013543c0ce79fca"
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
