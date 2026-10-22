cask "unix" do
  version "0.1.3"
  sha256 "5086f9bf41f9327139a0e3999274cdb83f9344a3d048fec9a6b2af34c2551b99"

  url "https://stealthoverlay.net/download/Unix-0.1.3.zip"
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
