class TuiMusic < Formula
  desc "Terminal music player with live FFT spectrum visualization (Rust)"
  homepage "https://github.com/Shiorangerin/tui-music"
  url "https://github.com/Shiorangerin/tui-music/archive/refs/tags/v0.1.22.tar.gz"
  sha256 "a94e813c8d9f4e29dd85287bd688617ee6f7653bde657c929e9e97404acfa98c"
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
