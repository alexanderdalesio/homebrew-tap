# frozen_string_literal: true

# Installs the unofficial dual-transport Focusrite Control API.
class FocusriteControlApi < Formula
  desc "Control Scarlett interfaces through direct USB or Focusrite Control 2"
  homepage "https://github.com/alexanderdalesio/focusrite-control-2-api"
  url "https://github.com/alexanderdalesio/focusrite-control-2-api/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "947a9fb460bf753315b859e1ee7e2fa698a1c24863ebedf11719c459b5dc9d6d"
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
