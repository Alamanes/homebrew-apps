class Md2pic < Formula
  desc "Convert Markdown files to PNG images"
  homepage "https://github.com/Alamanes/md2pic"
  url "https://github.com/Alamanes/md2pic/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "8d9eadb5cbc245eb12432632a1ca4fb50d6137b401732647a85a22d2fc4661b2"
  license "MIT"

  depends_on "node"

  def install
    system "npm", *std_npm_args
    libexec.install Dir["*"]
    (bin/"md2pic").write <<~EOS
      #!/bin/bash
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/md2pic.js" "$@"
    EOS
  end

  def post_install_steps
    ohai "Note: md2pic requires Google Chrome or Chromium to render images."
    ohai "If not installed, run: brew install --cask google-chrome"
  end

  test do
    (testpath/"test.md").write "# Hello\n\nTest **markdown** file."
    system bin/"md2pic", testpath/"test.md"
    assert_path_exists testpath/"test.png"
  end
end
