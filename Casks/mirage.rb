cask "mirage" do
  version "1.0.7"
  sha256 "dcde864994f6bd3f1d6e13e097f899e5ddb184f7b3e47451ae1f50181c5b2621"

  url "https://github.com/laobamac/MirageWallpaper/releases/download/v1.0.7/Mirage-308-a85684cb8790-macOS-arm64.zip"
  name "Mirage Wallpaper"
  desc "面向 macOS 的原生动态壁纸管理器与 Wallpaper Engine 兼容运行时"
  homepage "https://github.com/laobamac/MirageWallpaper"

  depends_on macos: :sonoma

  app "Mirage.app"

  zap trash: [
    "~/Library/Application Support/Mirage",
    "~/Library/Caches/cn.laobamac.Mirage",
    "~/Library/Preferences/cn.laobamac.Mirage.plist",
    "~/Library/Saved Application State/cn.laobamac.Mirage.savedState",
    "~/Library/Logs/Mirage",
    "~/Library/Screen Savers/MirageScreenSaver.saver",
  ]
end
