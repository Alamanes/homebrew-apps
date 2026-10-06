class Miyu4mac < Formula
  desc "Terminal AI assistant for macOS"
  homepage "https://github.com/Alamanes/Miyu-For-Mac"
  url "https://github.com/Alamanes/Miyu-For-Mac/releases/download/v0.2.1/miyu4mac-v0.2.1-arm64.tar.gz"
  sha256 "66235cbfc464cda1573aab5b819a12bb6034f202d6852dbdf083407cb5312811"
  license "MIT"

  def install
    bin.install "miyu4mac" => "miyu"
  end

  test do
    assert_match "Miyu", shell_output("#{bin}/miyu --version")
  end
end
