cask "changmun" do
  version "0.5.3"
  sha256 "feb7341411256efa328864cd0e7c803b5ce857a4596f6c908e0154bcd1a013c1"

  url "https://github.com/namekun/Changmun/releases/download/v#{version}/Changmun-#{version}.dmg"
  name "Changmun"
  desc "WebKit browser with a sidebar and an AI that can use it"
  homepage "https://github.com/namekun/Changmun"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Changmun.app"
  binary "#{appdir}/Changmun.app/Contents/Resources/changmun"

  uninstall quit: "io.github.namekun.Changmun"

  zap trash: [
    "~/Library/Application Support/Changmun",
    "~/Library/Caches/io.github.namekun.Changmun",
    "~/Library/HTTPStorages/io.github.namekun.Changmun",
    "~/Library/Preferences/io.github.namekun.Changmun.plist",
    "~/Library/WebKit/io.github.namekun.Changmun",
  ]
end
