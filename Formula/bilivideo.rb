class Bilivideo < Formula
  desc "网站视频嗅探+下载工具 (Rust) —— B站专精 API + 通用网页视频流提取 + HLS 下载，带进度条"
  homepage "https://github.com/Alamanes/BiliVideo"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/Alamanes/BiliVideo/releases/download/v0.1.0/bilivideo-aarch64-apple-darwin.tar.gz"
      sha256 "0eb14d6092a77c13df42f51c84fb768caead6ef9219eb753346d88d332a1a2b0"
    end
    on_intel do
      url "https://github.com/Alamanes/BiliVideo/releases/download/v0.1.0/bilivideo-x86_64-apple-darwin.tar.gz"
      sha256 "5ff266da176a8d12d878378b553aba9b294dc0ad09b9003f755a8edf759d1193"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alamanes/BiliVideo/releases/download/v0.1.0/bilivideo-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e81a5b5d834123317c88ae76a1d5297d3bcead438adbd0d06de9eec93c9e03ef"
    end
    on_intel do
      url "https://github.com/Alamanes/BiliVideo/releases/download/v0.1.0/bilivideo-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a47f75a58b9e96099962dec95f5c8032657aa327d929da293a76031712ffe05"
    end
  end

  def install
    bin.install "bvideo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bvideo --version")
  end
end
