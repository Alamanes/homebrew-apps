class Maboroshi < Formula
  v = "0.1.16"
  tag = "v#{v}"

  desc "Lightweight TUI music player via YouTube/Bilibili search (Rust)"
  homepage "https://github.com/KayneWang/maboroshi"
  url "https://github.com/KayneWang/maboroshi/releases/download/#{tag}/maboroshi-macos-aarch64"
  sha256 "bcfbaf09eef8f58f701569a1b58643ac1eea6322475331174440c28a4497676e"
  license "MIT"
  version v

  depends_on "yt-dlp"
  depends_on "mpv"

  def install
    bin.install "maboroshi-macos-aarch64" => "maboroshi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/maboroshi --version")
  end
end