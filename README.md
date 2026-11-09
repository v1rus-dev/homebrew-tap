# v1rus-dev Homebrew tap

## GitWarp

```sh
brew install --cask v1rus-dev/tap/gitwarp
```

Apple Silicon, macOS 11 or newer. GitWarp is ad-hoc signed but not notarized, so the cask
removes the quarantine attribute after installing (`xattr -dr com.apple.quarantine`).
If you prefer Gatekeeper to stay in charge, download the `.dmg` from the
[releases page](https://github.com/v1rus-dev/GitWarp/releases) instead.

Update and remove:

```sh
brew upgrade --cask gitwarp
brew uninstall --cask gitwarp
brew uninstall --zap --cask gitwarp   # also removes settings
```

The cask is bumped automatically by the GitWarp release workflow.
