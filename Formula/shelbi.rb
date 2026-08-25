class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.9.0/shelbi_Darwin_arm64.tar.gz"
      sha256 "652e22c2ae389736994eda6509b07ae1b23d9795cd4a16bdb6fc9afb92d9b716"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.9.0/shelbi_Darwin_x86_64.tar.gz"
      sha256 "288de7862c421023a63c5c0457d2bf638662c26193a3c2310e350101c55b3d23"
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
