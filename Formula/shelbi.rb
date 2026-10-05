class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.10.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "c249447c1fbee530b7f6870528ede82016f00794557f7e91eb4d1f6964e92dcc"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.10.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "c6e6ddafd37ce0bcce641d759db58d4903b4ce9a744c2e35cb6e6e8e225f7ad2"
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
