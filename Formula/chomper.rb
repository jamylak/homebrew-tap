class Chomper < Formula
  desc "Trim trailing newline and carriage return bytes from a file in-place"
  homepage "https://github.com/jamylak/chomper"
  license :cannot_represent

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jamylak/chomper/releases/download/v0.1.0/chomper-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d76cf26466755bffa41b6f5e8741e8b91fab837b8f3d05c95888e6d6de7c80bf"
    else
      url "https://github.com/jamylak/chomper/releases/download/v0.1.0/chomper-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "0cb3660cce31ba798370f473390045c277247784d2fa2d217725fe9b46a54a01"
    end
  end

  def install
    bin.install "chomper"
  end

  test do
    path = testpath/"sample.txt"
    path.write "hello\n\n"

    system bin/"chomper", path

    assert_equal "hello", path.read
  end
end
