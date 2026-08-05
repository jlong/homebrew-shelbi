class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.7.2/shelbi_Darwin_arm64.tar.gz"
      sha256 "10ecc5bac9495665ecd18066184bc42669a3cdea0d23dcb04026970769a18ec8"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.7.2/shelbi_Darwin_x86_64.tar.gz"
      sha256 "51caa4177086d2f3fd78994e2fb2019de69ac73ada908d6f27001c17574008ab"
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
