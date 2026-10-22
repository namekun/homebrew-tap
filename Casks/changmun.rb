cask "changmun" do
  version "0.5.0"
  sha256 "b70f3aeacd90b65f449e821f58b705d9da026a0e0efeb71609c8a349cca652d0"

  url "https://github.com/namekun/Changmun/releases/download/v#{version}/Changmun-#{version}.dmg"
  name "Changmun"
  desc "WebKit browser with a sidebar and an AI that can use it"
  homepage "https://github.com/namekun/Changmun"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Changmun.app"
  binary "#{appdir}/Changmun.app/Contents/Resources/changmun"

  # This version is signed with a Developer ID but not notarized. Where macOS won't let the terminal change apps
  # (App Management), the app keeps its quarantine and opens with Open Anyway in Privacy & Security.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Changmun.app"], must_succeed: false
  end

  uninstall quit: "io.github.namekun.Changmun"

  zap trash: [
    "~/Library/Application Support/Changmun",
    "~/Library/Caches/io.github.namekun.Changmun",
    "~/Library/HTTPStorages/io.github.namekun.Changmun",
    "~/Library/Preferences/io.github.namekun.Changmun.plist",
    "~/Library/WebKit/io.github.namekun.Changmun",
  ]
end
