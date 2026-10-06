class Tokstat < Formula
  desc "Pi-agent session token usage stats CLI with GitHub-style heatmap (Rust)"
  homepage "https://github.com/Alamanes/tokstat"
  url "https://github.com/Alamanes/tokstat/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "23848dc6b265cefe04fba73173af68e02ce9db85ff85c93cc46b519568d56e89"
  license "MIT"
  head "https://github.com/Alamanes/tokstat.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tokstat --version")
  end
end
