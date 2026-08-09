class TuiMusic < Formula
  desc "Terminal music player with live FFT spectrum visualization (Rust)"
  homepage "https://github.com/Shiorangerin/tui-music"
  url "https://github.com/Shiorangerin/tui-music/archive/refs/tags/v0.1.21.tar.gz"
  sha256 "277c6244f145962e744819b7ba6aafd884bc85546f676341b7e7f0afe4f6b09f"
  license "MIT"
  head "https://github.com/Shiorangerin/tui-music.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
    # macOS 15.4+ 系统媒体集成要求 com.apple.* 代码签名标识，
    # 否则控制中心/媒体键静默失效；构建产物必须重新签名。
    if OS.mac?
      bin.children.each do |f|
        system "codesign", "--force", "-s", "-", "--identifier", "com.apple.tui-music", f
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tui-music --version")
  end
end
