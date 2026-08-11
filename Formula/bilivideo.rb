class Bilivideo < Formula
  desc "网站视频嗅探+下载工具 (Rust) —— B站专精 API + 通用网页视频流提取 + HLS 下载，带进度条"
  homepage "https://github.com/Shiorangerin/BiliVideo"
  license "MIT"

  depends_on "ffmpeg"

  on_macos do
    on_arm do
      url "https://github.com/Shiorangerin/BiliVideo/releases/download/v0.1.0/bilivideo-aarch64-apple-darwin.tar.gz"
      sha256 "cfcf0edc71f221c378b179860bd3e4b03d3c558ad824c857f3645ba1200fa826"
    end
    on_intel do
      url "https://github.com/Shiorangerin/BiliVideo/releases/download/v0.1.0/bilivideo-x86_64-apple-darwin.tar.gz"
      sha256 "740487af6004674754fb8be652943b11c7ab976bdcfe05dc675ab2303434ad4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Shiorangerin/BiliVideo/releases/download/v0.1.0/bilivideo-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e7cebf89289762cb1863992123107e50fdf81f5adee2ad6d08ec1c651d461af4"
    end
    on_intel do
      url "https://github.com/Shiorangerin/BiliVideo/releases/download/v0.1.0/bilivideo-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d939379629d71f5ee0a1f12df633c55983fd86654fdc007acd6673460c9753b"
    end
  end

  def install
    bin.install "bvideo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bvideo --version")
  end
end
