class SaraCli < Formula
  desc "Requirements knowledge graph CLI"
  homepage "https://github.com/cledouarec/sara"
  url "https://github.com/cledouarec/sara/archive/refs/tags/sara-cli-v0.12.3.tar.gz"
  sha256 "fe75267537cf26e2ac58080a9181d4ebd8b174c113659fbc6566549ceda7612b"
  license "Apache-2.0"

  depends_on "rust" => :build

  deny_network_access!

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "sara-cli")
  end

  test do
    assert_match "sara #{version}", shell_output("#{bin}/sara --version")
    assert_match "item_types:", shell_output("#{bin}/sara schema")
  end
end
