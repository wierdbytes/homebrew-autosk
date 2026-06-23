# NOTE: this file is regenerated end-to-end by the release workflow in
# wierdbytes/autosk on every STABLE tagged release. Edit it by hand only if you
# know what you're doing -- your changes will be overwritten on the
# next release.
cask "autosk" do
  version "0.2.0"
  sha256 "0213281932f9a311413d439412475043b72878d66cb0f82a707dca7df072b4b6"

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
