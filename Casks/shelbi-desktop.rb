cask "shelbi-desktop" do
  version "0.15.0"
  sha256 "5c3607bd2058be3f3e397c4d90044c75c07ac43da4e4f807bb1bc81d9bbbb1c7"

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
