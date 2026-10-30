# frozen_string_literal: true

# Installs the unofficial dual-transport Focusrite Control API.
class FocusriteControlApi < Formula
  desc "Control Scarlett interfaces through direct USB or Focusrite Control 2"
  homepage "https://github.com/alexanderdalesio/focusrite-control-2-api"
  url "https://github.com/alexanderdalesio/focusrite-control-2-api/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "f765416ab590e66d6b9c87645e78a9242288afd8d738ffcfabf0804c63bfab73"
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
