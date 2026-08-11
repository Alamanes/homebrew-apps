class Tokstat < Formula
  desc "Pi-agent session token usage stats CLI with GitHub-style heatmap (Rust)"
  homepage "https://github.com/Shiorangerin/tokstat"
  url "https://github.com/Shiorangerin/tokstat/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2ecb5f9b75322dc3209db68829a5223590851b3e21454b8c608eb189ee09ed78"
  license "MIT"
  head "https://github.com/Shiorangerin/tokstat.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tokstat --version")
  end
end
