cask "nunsseop" do
  version "0.32.0"
  sha256 "c5f0647012649301c77278c5a68c55cca37d528b226fde4064189cd070bc512a"

  url "https://github.com/namekun/Nunsseop/releases/download/v#{version}/Nunsseop-#{version}.dmg"
  name "Nunsseop"
  desc "Notch utility for now playing, a file shelf, calendar and system HUDs"
  homepage "https://namekun.github.io/Nunsseop/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
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
