cask "unix" do
  version "0.1.4"
  sha256 "d67eaaa6fcac757633dbefa9c6eb8e936d305be70e1f8231fe14779b95f03063"

  url "https://stealthoverlay.net/download/Unix-0.1.4.zip"
  name "StealthOverlay"
  desc "Overlay panel that stays out of screen captures"
  homepage "https://stealthoverlay.net"

  app "Unix.app"

  # Homebrew quarantines whatever it downloads; the app is signed locally rather than notarised, so
  # Gatekeeper would refuse the first launch. Strip the flag after install — this is what makes a
  # cask install behave like the one-line installer, which never sets it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/Unix.app"]
  end

  caveats <<~EOS
    It needs Screen Recording and Full Disk Access, and arming needs SIP and AMFI off.
    Run the in-app installer or `Unix login <code>` to attach this Mac to your account.
  EOS
end
