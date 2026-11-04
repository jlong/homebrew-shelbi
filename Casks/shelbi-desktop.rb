cask "shelbi-desktop" do
  version "0.13.3"
  sha256 "c3063f845b5e0a3c577d72db31cdd0a933e950df55a3a5ddf3c48a076517936c"

  url "https://github.com/jlong/shelbi/releases/download/v#{version}/Shelbi-#{version}-arm64.zip"
  name "Shelbi"
  desc "Native desktop client for the Shelbi agent orchestrator"
  homepage "https://github.com/jlong/shelbi"

  livecheck do
    url :url
    strategy :github_latest
  end

  # `brew style` wants the depends_on stanzas in this (alphabetical) order.
  depends_on arch: :arm64
  # The app is a client of the CLI and its daemon, at the same version.
  depends_on formula: "jlong/shelbi/shelbi"
  depends_on macos: :sequoia

  app "Shelbi.app"

  zap trash: [
    "~/.shelbi/desktop-update-check.json",
    "~/.shelbi/projects/*/desktop-window.json",
  ]
end
