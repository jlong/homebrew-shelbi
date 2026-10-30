cask "shelbi-desktop" do
  version "0.12.0"
  sha256 "2b055fdc1ccc7721e8d586738dcdc198577b117b6496a203b878f7382443ebf7"

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
