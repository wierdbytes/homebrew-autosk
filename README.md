# homebrew-autosk

[Homebrew](https://brew.sh) tap for [`autosk`](https://github.com/wierdbytes/autosk) — a task manager and workflow manager for coding agents.

> **Formula retired.** The old `Formula/autosk.rb` (a bare CLI binary) has been
> removed. This tap is now **cask-only**: install the signed/notarized macOS app
> with `brew install --cask wierdbytes/autosk/autosk`. On **Linux**, install from
> the [GitHub Release assets](https://github.com/wierdbytes/autosk/releases) (or
> npm) — Homebrew is not used on Linux.

## Install

```sh
brew install --cask wierdbytes/autosk/autosk
```

## Upgrade

```sh
brew update
brew upgrade --cask autosk
```

## Uninstall

```sh
brew uninstall --cask autosk
brew untap wierdbytes/autosk    # optional: drop the tap itself
```

## What you get

The signed + notarized **autosk** GUI app (`autosk.app`) for macOS (Apple
Silicon, arm64). The bundle embeds the CLI/TUI and the daemon as sidecars, and
the cask symlinks both onto your `PATH`:

| Command   | Source                                       |
| --------- | -------------------------------------------- |
| `autosk`  | `autosk.app/Contents/MacOS/autosk-cli`       |
| `autoskd` | `autosk.app/Contents/MacOS/autoskd`          |

So a terminal `autosk`/`autoskd` works, and launching the app from Finder
auto-spawns the embedded daemon — no shell `PATH` dependency.

| Platform        | Distribution                                  |
| --------------- | --------------------------------------------- |
| macOS (arm64)   | this cask (`brew install --cask …`)           |
| Linux (x86_64)  | [Release assets](https://github.com/wierdbytes/autosk/releases) / npm |

macOS Intel and other platforms aren't covered by the cask. The DMG is signed
with a Developer ID certificate and notarized + stapled, so Gatekeeper treats it
as trusted on first launch.

## How it stays in sync

Every **stable** tagged release in `wierdbytes/autosk` triggers a workflow that
recomputes the DMG SHA-256 and pushes an updated `Casks/autosk.rb` here. There's
no manual bookkeeping; if `wierdbytes/autosk` shipped a stable release, this tap
already knows about it. Pre-release tags (`-rc`, `-beta`, …) go to TestFlight and
do **not** bump the cask.
