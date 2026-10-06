class BiliMusic < Formula
  desc "极简 Bilibili 音视频批量提取工具 (Rust) —— 从任意 txt 扫描所有 BV 链接批量下载"
  homepage "https://github.com/Alamanes/BiliMusic"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/Alamanes/BiliMusic/releases/download/v0.2.0/bili-music-aarch64-apple-darwin.tar.gz"
      sha256 "f12e2d4d702afc7e5851c2f88e496823f5b145eb17043869ad30f9aba035917b"
    end
    on_intel do
      url "https://github.com/Alamanes/BiliMusic/releases/download/v0.2.0/bili-music-x86_64-apple-darwin.tar.gz"
      sha256 "0afe3bcd28892dda32091220809743d0b49811e820c5ef5bfd25fc7f28c19a9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Alamanes/BiliMusic/releases/download/v0.2.0/bili-music-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "680e2ab9c9500e1b9160e2e125b43b2ec8a558cff6cfd0d5abd9cd773f2c22cc"
    end
    on_intel do
      url "https://github.com/Alamanes/BiliMusic/releases/download/v0.2.0/bili-music-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb76055bff3f046474545e1c9d6405216a75172141dedb0248e040f787598bcb"
    end
  end

  def install
    bin.install "bmusic"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bmusic --version")
  end
end
