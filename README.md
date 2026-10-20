# homebrew-unix

The tap for StealthOverlay's cask. Homebrew 7 refuses casks outside a tap, so this directory is the
publishable repository (`unix/homebrew-unix`) rather than a URL users can `brew install` directly.

```sh
brew tap unix/homebrew-unix
brew install --cask unix
brew upgrade --cask unix
```

`Casks/unix.rb` is generated from the live release — never edited by hand:

```sh
curl -fsSL https://stealthoverlay.net/unix.rb -o homebrew/Casks/unix.rb
git add Casks/unix.rb && git commit -m "unix $(…) " && git push
```

The cask's `url` points at `https://stealthoverlay.net/download/Unix-<version>.zip`, which redirects
to the object in Supabase Storage, and its `sha256` is computed by the Worker when the zip is
uploaded. Publishing a release at `/admin/releases` and syncing this file is the whole release
process.
