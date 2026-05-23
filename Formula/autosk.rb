# NOTE: this file is regenerated end-to-end by the release workflow in
# wierdbytes/autosk on every tagged release. Edit it by hand only if
# you know what you're doing -- your changes will be overwritten on the
# next release.
class Autosk < Formula
  desc "Task manager and workflow manager for coding agents"
  homepage "https://github.com/wierdbytes/autosk"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wierdbytes/autosk/releases/download/v#{version}/autosk-osx-arm64"
      sha256 "72088190f5a08789e3e54ec46776779a2b5d5afa0b0bec44ef833f213e85f62c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wierdbytes/autosk/releases/download/v#{version}/autosk-linux-x64"
      sha256 "e3cf5f5d03f66e24fb810da94b08d2688f13db90d008093a18fdfb6a09751d0e"
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
