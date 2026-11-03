cask "shelbi-desktop" do
  version "0.13.2"
  sha256 "399f7f7973e096a6f227b6b9aa8623c7322cea57d8f53b930ecf9daece3daf9e"

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
