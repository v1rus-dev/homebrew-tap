cask "gitwarp" do
  version "0.4.0"
  sha256 "ebd030f113b6385b7cab34675ff8433e116345d7c8efb37606789a3229a85a0d"

  url "https://github.com/v1rus-dev/GitWarp/releases/download/v#{version}/gitwarp-#{version}-macos-aarch64.dmg"
  name "GitWarp"
  desc "Fast, native Git client"
  homepage "https://github.com/v1rus-dev/GitWarp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "GitWarp.app"

  # GitWarp is ad-hoc signed but not notarized. Without this, Gatekeeper
  # refuses to launch an app that carries the quarantine attribute.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/GitWarp.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.v1rus.gitwarp",
    "~/Library/Caches/dev.v1rus.gitwarp",
    "~/Library/Preferences/dev.v1rus.gitwarp.plist",
    "~/Library/Saved Application State/dev.v1rus.gitwarp.savedState",
  ]

  caveats <<~EOS
    GitWarp is not notarized by Apple. The quarantine attribute was removed
    from #{appdir}/GitWarp.app during installation so the app can launch.
  EOS
end
