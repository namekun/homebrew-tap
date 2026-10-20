cask "changmun" do
  version "0.4.1"
  sha256 "e5ed76a0884a3233b3ded8238030890e2592245a888281132efa56b3672f70e7"

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

  uninstall quit: "io.github.namekun.Changmun"

  zap trash: [
    "~/Library/Application Support/Changmun",
    "~/Library/Caches/io.github.namekun.Changmun",
    "~/Library/HTTPStorages/io.github.namekun.Changmun",
    "~/Library/Preferences/io.github.namekun.Changmun.plist",
    "~/Library/WebKit/io.github.namekun.Changmun",
  ]
end
