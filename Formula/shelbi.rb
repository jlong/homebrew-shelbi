class Shelbi < Formula
  desc "Open-source agent orchestrator for parallel coding agents"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.12.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "578c422cd48e2450e2262f7df98d703e6ea45545c1f46b3a1ba375d963977cc9"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.12.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "2b5395b76aa2f15c45f35a3e89fd20ce899a31369995cc372bdc1c1923f7c3d6"
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
