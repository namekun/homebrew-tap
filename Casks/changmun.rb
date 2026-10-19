cask "changmun" do
  version "0.1.1"
  sha256 "e661fb8b53940fc15e0a78508fbbbf54c01b5bafbfe2f21a111b2262114f7919"

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

  # The app is ad-hoc signed and not notarized.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Changmun.app"]
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
