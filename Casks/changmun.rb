cask "changmun" do
  version "0.11.0"
  sha256 "a50b2fa146ade45c2ef1a2f9bf925b93c201ce708753a514fae05ee083657960"

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

  uninstall quit: [
    "io.github.namekun.Changmun",
    "io.github.namekun.Changmun.agent",
  ]

  zap trash: [
    "~/Library/Application Support/Changmun Agent",
    "~/Library/Application Support/Changmun Headless",
    "~/Library/Application Support/Changmun",
    "~/Library/Caches/io.github.namekun.Changmun",
    "~/Library/Caches/io.github.namekun.Changmun.agent",
    "~/Library/Caches/io.github.namekun.Changmun.headless",
    "~/Library/HTTPStorages/io.github.namekun.Changmun",
    "~/Library/HTTPStorages/io.github.namekun.Changmun.agent",
    "~/Library/HTTPStorages/io.github.namekun.Changmun.headless",
    "~/Library/Preferences/io.github.namekun.Changmun.agent.plist",
    "~/Library/Preferences/io.github.namekun.Changmun.headless.plist",
    "~/Library/Preferences/io.github.namekun.Changmun.plist",
    "~/Library/WebKit/io.github.namekun.Changmun",
    "~/Library/WebKit/io.github.namekun.Changmun.agent",
    "~/Library/WebKit/io.github.namekun.Changmun.headless",
  ]
end
