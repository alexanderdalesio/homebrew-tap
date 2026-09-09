class FocusriteControlApi < Formula
  desc "Control Scarlett interfaces through direct USB or Focusrite Control 2"
  homepage "https://github.com/alexanderdalesio/focusrite-control-2-api"
  url "https://github.com/alexanderdalesio/focusrite-control-2-api/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "c8a6114d5cd79dab85f3932050d5eb3403de4d7c6ba5d08eec5153a2718854e3"
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
