class UpscaylBin < Formula
  desc "Real-ESRGAN AI image upscaler (ncnn/Vulkan backend, native arm64)"
  homepage "https://github.com/upscayl/upscayl-ncnn"
  url "https://github.com/upscayl/upscayl-ncnn/releases/download/20251207-174704/upscayl-bin-20251207-174704-macos.zip"
  sha256 "277419791281a56eae0c739c70120b974d7267cf7c2de8e86dc09798d4b314db"
  license "MIT"

  # 预编译 universal (x86_64 + arm64) 二进制，Apple Silicon 上原生加载 arm64 切片，
  # 通过 MoltenVK 调用 Metal 使用 GPU，无需 CUDA / PyTorch / 系统 Python。
  def install
    bin.install "upscayl-bin"
  end

  test do
    assert_match "Usage: upscayl-bin", shell_output("#{bin}/upscayl-bin -h 2>&1", 1)
  end
end
