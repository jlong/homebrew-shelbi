class Shelbi < Formula
  desc "Open-source agent orchestrator built on tmux"
  homepage "https://github.com/jlong/shelbi"
  version "0.7.1"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jlong/shelbi/releases/download/v0.7.1/shelbi_Darwin_arm64.tar.gz"
      sha256 "cb4ee7c6f8c184687badeb66ad1aae6538c034a13180d5a77092d55cbd89569f"
    else
      url "https://github.com/jlong/shelbi/releases/download/v0.7.1/shelbi_Darwin_x86_64.tar.gz"
      sha256 "55a23b6dfab7bb945b440f24faaadb1dc7377f2531ff457363eb354126229197"
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
