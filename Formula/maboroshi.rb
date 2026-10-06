class Maboroshi < Formula
  desc "Lightweight TUI music player via YouTube/Bilibili search (Rust)"
  homepage "https://github.com/KayneWang/maboroshi"
  url "https://github.com/KayneWang/maboroshi/releases/download/v0.1.16/maboroshi-macos-aarch64"
  sha256 "bcfbaf09eef8f58f701569a1b58643ac1eea6322475331174440c28a4497676e"
  license "MIT"

  depends_on "mpv"
  depends_on "yt-dlp"

  def install
    bin.install "maboroshi-macos-aarch64" => "maboroshi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maboroshi --version")
  end
end
