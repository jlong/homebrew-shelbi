class Shelbi < Formula
  desc "Open-source agent orchestrator for parallel coding agents"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.13.1/shelbi_Darwin_arm64.tar.gz"
      sha256 "a8543e59045ec9dc9e6e8d91749c9550ba42707c7d7c9266d830d9f53aa3fcb6"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.13.1/shelbi_Darwin_x86_64.tar.gz"
      sha256 "1ae9a1cec035f23347d5d3a06c0f94d28b23487ef4ec1823ed8fd147bdcedd25"
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
