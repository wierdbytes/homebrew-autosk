# NOTE: this file is regenerated end-to-end by the release workflow in
# wierdbytes/autosk on every tagged release. Edit it by hand only if
# you know what you're doing -- your changes will be overwritten on the
# next release.
class Autosk < Formula
  desc "Task manager and workflow manager for coding agents"
  homepage "https://github.com/wierdbytes/autosk"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wierdbytes/autosk/releases/download/v#{version}/autosk-osx-arm64"
      sha256 "1866996210c9205688c56ef085944a217f7c280e16350801cffbb480c16da9f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wierdbytes/autosk/releases/download/v#{version}/autosk-linux-x64"
      sha256 "716d2b603b28ac439d4e26552bcf42d62a46877d223dc5b64c7d3e3fc33026db"
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
