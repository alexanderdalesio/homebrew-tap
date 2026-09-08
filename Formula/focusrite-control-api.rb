class FocusriteControlApi < Formula
  desc "Control Scarlett interfaces through direct USB or Focusrite Control 2"
  homepage "https://github.com/alexanderdalesio/focusrite-control-2-api"
  url "https://github.com/alexanderdalesio/focusrite-control-2-api/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "bd4ef552ce661aaa492ed6bfcfee02abf13aa7e7593358e20eaa194114321d71"
  license "MIT"

  depends_on "python@3.14" => :build
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match "Focusrite Control API", shell_output("#{bin}/focusrite help")
  end
end
