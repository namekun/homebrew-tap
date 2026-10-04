cask "nunsseop" do
  version "0.7.5"
  sha256 "cc58bac56f8def7c27ed31a283dbd7c0f52d3c5213cabdec3a8746d0d8167823"

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
