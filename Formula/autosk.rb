# NOTE: this file is regenerated end-to-end by the release workflow in
# wierdbytes/autosk on every tagged release. Edit it by hand only if
# you know what you're doing -- your changes will be overwritten on the
# next release.
class Autosk < Formula
  desc "Task manager and workflow manager for coding agents"
  homepage "https://github.com/wierdbytes/autosk"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wierdbytes/autosk/releases/download/v#{version}/autosk-osx-arm64"
      sha256 "93ee29b5c4e767d5ed3d8b5602aacc8dcd02fdcf2f149a687e22322184674c18"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wierdbytes/autosk/releases/download/v#{version}/autosk-linux-x64"
      sha256 "602bb786b1d2bcd8b6dd0c9c3664d56642580fd951867efc93d9945a0d50b1e9"
    end
  end

  def install
    binary = OS.mac? ? "autosk-osx-arm64" : "autosk-linux-x64"
    bin.install binary => "autosk"
  end

  test do
    # `autosk version` prints the buildinfo Version string, which is
    # the same tag we point the URL at. Substring-match so it works
    # whether or not the build embedded a leading 'v'.
    assert_match version.to_s, shell_output("#{bin}/autosk version")
  end
end
