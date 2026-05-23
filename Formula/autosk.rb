# NOTE: this file is regenerated end-to-end by the release workflow in
# wierdbytes/autosk on every tagged release. Edit it by hand only if
# you know what you're doing — your changes will be overwritten on the
# next release.
class Autosk < Formula
  desc "Task manager and workflow manager for coding agents"
  homepage "https://github.com/wierdbytes/autosk"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wierdbytes/autosk/releases/download/v#{version}/autosk-osx-arm64"
      sha256 "76104fa4b7bb65ae2193f5d7c91af5f59dbe11561bad4b46adce10694e8dcafc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wierdbytes/autosk/releases/download/v#{version}/autosk-linux-x64"
      sha256 "5a02a98a4b77365246365791e752e9365b9e735ddae65fa4c234b03a833e083a"
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
