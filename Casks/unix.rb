cask "unix" do
  version "0.1.5"
  sha256 "cdb88d39ade5a5c0c38a9c7c70b9065b91d6bca32b0bd28ea3de19f420b9bf5c"

  url "https://stealthoverlay.net/download/Unix-brew-0.1.5.zip"
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
