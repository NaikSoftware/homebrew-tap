# NaikSoftware Homebrew tap

```sh
brew install --cask naiksoftware/tap/elis
```

Upgrade with `brew upgrade --cask elis`.

[Elis](https://github.com/NaikSoftware/elis) is not notarized.
The cask removes the `com.apple.quarantine` flag from `Elis.app` during install, so macOS opens it without the Gatekeeper prompt.
Install from the [release DMG](https://github.com/NaikSoftware/elis/releases/latest) instead if you do not want that.

The `elis` release workflow updates `Casks/elis.rb`; do not edit `version` or `sha256` by hand.
