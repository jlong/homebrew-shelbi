cask "shelbi-desktop" do
  version "0.11.0"
  sha256 "06eaf09bd310d82d3c9b9393abb41797ca7a7c193e42c4ef2d22f2a9611e68f7"

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
