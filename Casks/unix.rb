cask "unix" do
  version "0.1.6"
  sha256 "ef660bed98008fa1f359087412afd12c5566e1bb84fb563cf8898a4f5d1aa793"

  url "https://stealthoverlay.net/download/Unix-brew-0.1.6.zip"
  name "StealthOverlay"
  desc "Overlay panel that stays out of screen captures"
  homepage "https://stealthoverlay.net"

  app "Unix.app"
  binary "#{appdir}/Unix.app/Contents/MacOS/Unix", target: "unix"

  # Homebrew quarantines whatever it downloads; the app is signed locally rather than notarised, so
  # Gatekeeper would refuse the first launch. Strip the flag after install — this is what makes a
  # cask install behave like the one-line installer, which never sets it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/Unix.app"]
  end

  caveats <<~EOS
    It needs Screen Recording and Full Disk Access, and arming needs SIP and AMFI off.
    Run the in-app installer, or `unix login <code>` (`unix status` for state) to attach this Mac.
  EOS
end
