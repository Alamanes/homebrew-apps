class Ceteharness < Formula
  desc "Ceteaonia Harness CLI: personal agent harness reusing pi's model catalog"
  homepage "https://github.com/Alamanes/ceteharness"
  url "file:///Users/orangerin/Desktop/Code/ceteharness/dist/ceteharness-0.1.0.tar.gz"
  sha256 "72f63f816ac567d301e9bfd228723f3b803ed3aa449dab3c49a54841eba3615b"
  license "MIT"
  version "0.1.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", ".", "--locked"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ceteharness --version")
  end
end
