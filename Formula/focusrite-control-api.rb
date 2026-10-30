# frozen_string_literal: true

# Installs the unofficial dual-transport Focusrite Control API.
class FocusriteControlApi < Formula
  desc "Control Scarlett interfaces through direct USB or Focusrite Control 2"
  homepage "https://github.com/alexanderdalesio/focusrite-control-2-api"
  url "https://github.com/alexanderdalesio/focusrite-control-2-api/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "b7031fdfe9b6e6c4e4c4de1b6aaf1091ec1879bc252dd19eb228876659f7373d"
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
