class Chomper < Formula
  desc "Trim trailing newline and carriage return bytes from a file in-place"
  homepage "https://github.com/jamylak/chomper"
  url "https://github.com/jamylak/chomper/archive/895b20d8ec95400e8063b59968f9b348cd2603a7.tar.gz"
  version "0.1.0"
  sha256 "26f5c77274ed70941f209a2a91d0b61b2775f88e0d79b682117b259c9c1382e6"
  license :cannot_represent
  head "https://github.com/jamylak/chomper.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    path = testpath/"sample.txt"
    path.write "hello\n\n"

    system bin/"chomper", path

    assert_equal "hello", path.read
  end
end
