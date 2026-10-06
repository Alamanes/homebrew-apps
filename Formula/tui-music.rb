class TuiMusic < Formula
  desc "Terminal music player with live FFT spectrum visualization (Rust)"
  homepage "https://github.com/Alamanes/tui-music"
  url "https://github.com/Alamanes/tui-music/archive/refs/tags/v0.1.25.tar.gz"
  sha256 "343713871e628da5e163aeb2e613e004e5bed3d52bea73cabba4db6c96e00f7c"
  license "MIT"
  head "https://github.com/Alamanes/tui-music.git", branch: "main"

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
