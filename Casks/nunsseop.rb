cask "nunsseop" do
  version "0.18.1"
  sha256 "bc55a9fc2b2560a22e12092267d39e5a805c102c7bc187e11b628f0cbc50323e"

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
