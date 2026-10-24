class Shelbi < Formula
  desc "Open-source agent orchestrator for parallel coding agents"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.11.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "1007eb35bf0e95ef8306d944bef88715e4a9a6cfb32deef84803cceb3fbe9865"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.11.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "03644e68fc4326f5224f1753280678adc722d8b590d6e628285ac03a8d9700f2"
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
