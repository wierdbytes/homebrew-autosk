# NOTE: this file is regenerated end-to-end by the release workflow in
# wierdbytes/autosk on every STABLE tagged release. Edit it by hand only if you
# know what you're doing -- your changes will be overwritten on the
# next release.
cask "autosk" do
  version "0.2.5"
  sha256 "19b8f0189577305acfa724d3c4459ed5ba024b1d240d9f1764e08eea0dfc15fa"

  url "https://github.com/wierdbytes/autosk/releases/download/v#{version}/autosk_#{version}_aarch64.dmg"
  name "autosk"
  desc "Task manager and workflow manager for coding agents"
  homepage "https://github.com/wierdbytes/autosk"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "autosk.app"

  # The GUI embeds the CLI/TUI + daemon as sidecars; expose both on PATH.
  # The CLI sidecar is named `autosk-cli` inside the bundle (the app's
  # own main binary is already `autosk`), so rename it back to `autosk`.
  binary "#{appdir}/autosk.app/Contents/MacOS/autosk-cli", target: "autosk"
  binary "#{appdir}/autosk.app/Contents/MacOS/autoskd"

  zap trash: [
    "~/.autosk",
    "~/Library/Application Support/autosk",
    "~/Library/Application Support/app.autosk.gui",
  ]
end
