cask "unix" do
  version "0.1.2"
  sha256 "d6e5bffb94571f84b5ccbbb58bcaab21d5db958dafe558cf0d0890f1244d7955"

  url "https://stealthoverlay.net/download/Unix-0.1.2.zip"
  name "StealthOverlay"
  desc "Overlay panel that stays out of screen captures"
  homepage "https://stealthoverlay.net"

  app "Unix.app"

  caveats <<~EOS
    StealthOverlay needs Screen Recording and Full Disk Access, and arming needs SIP and AMFI off.
    Run the in-app installer or `Unix login <code>` to attach this Mac to your account.
  EOS
end
