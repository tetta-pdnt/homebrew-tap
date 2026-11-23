class SaraTui < Formula
  desc "Terminal UI for SARA requirements and traceability"
  homepage "https://github.com/tetta-pdnt/sara-tui"
  url "https://github.com/tetta-pdnt/sara-tui/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3533c7dcf1715a804a644186d80e0747c85af1841f211a046c2285a5e137596d"
  license "MIT"

  depends_on "rust" => :build
  depends_on "leaf-markdown-viewer"
  depends_on "tetta-pdnt/tap/sara-cli"

  deny_network_access!

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "sara-tui #{version}", shell_output("#{bin}/sara-tui --version")
  end
end
