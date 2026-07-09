# Shelbi Homebrew Tap

The Homebrew tap for [Shelbi](https://github.com/jlong/shelbi), an open-source,
personal agent orchestrator for the terminal.

## Install

```bash
brew tap jlong/shelbi
brew trust jlong/shelbi
brew install shelbi
```

`brew trust` authorizes this tap's formula; recent Homebrew requires it for taps
outside homebrew-core. Then confirm the install:

```bash
shelbi --version
```

## Upgrade

```bash
brew update
brew upgrade shelbi
```

## About

`Formula/shelbi.rb` installs the prebuilt macOS release archive (Apple Silicon
or Intel) from the [Shelbi GitHub Releases](https://github.com/jlong/shelbi/releases),
and is updated automatically each time a new version is tagged.

- Project and source: https://github.com/jlong/shelbi
- Website and docs: https://shelbi.dev

On Linux, install from the APT repository instead. See the
[install guide](https://shelbi.dev/docs/guides/getting-started/install).
