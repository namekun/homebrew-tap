cask "nunsseop" do
  version "0.5.0"
  sha256 "55437450a09b45a4663cd9be630134614b670f16151d6ed2d64522d24310914d"

  url "https://github.com/namekun/Nunsseop/releases/download/v#{version}/Nunsseop-#{version}.dmg"
  name "Nunsseop"
  desc "Notch utility for now playing, a file shelf, calendar and system HUDs"
  homepage "https://namekun.github.io/Nunsseop/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Nunsseop.app"

  # The app is ad-hoc signed and not notarized.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Nunsseop.app"]
  end

  uninstall quit: "io.github.namekun.Nunsseop"

  zap trash: [
    "~/Library/Application Support/Nunsseop",
    "~/Library/Preferences/io.github.namekun.Nunsseop.plist",
  ]
end
