class TuiMusicFetchLrc < Formula
  desc "Batch download synced LRC lyrics (LRCLIB + NetEase fallback)"
  homepage "https://github.com/Shiorangerin/tui-music"
  url "https://github.com/Shiorangerin/tui-music/archive/refs/tags/v0.1.25.tar.gz"
  sha256 "343713871e628da5e163aeb2e613e004e5bed3d52bea73cabba4db6c96e00f7c"
  license "MIT"
  head "https://github.com/Shiorangerin/tui-music.git", branch: "main"

  depends_on "python@3.12" => :optional

  def install
    bin.install "scripts/fetch-lrc.py" => "tui-music-fetch-lrc"
  end

  test do
    assert_match "tui-music-fetch-lrc", shell_output("#{bin}/tui-music-fetch-lrc --help 2>&1")
  end
end
