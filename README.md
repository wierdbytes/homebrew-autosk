# homebrew-autosk

[Homebrew](https://brew.sh) tap for [`autosk`](https://github.com/wierdbytes/autosk) — a task manager and workflow manager for coding agents.

## Install

```sh
brew install wierdbytes/autosk/autosk
```

## Upgrade

```sh
brew update
brew upgrade autosk
```

## Uninstall

```sh
brew uninstall autosk
brew untap wierdbytes/autosk    # optional: drop the tap itself
```

## What you get

A prebuilt `autosk` binary on:

| Platform        | Asset                  |
| --------------- | ---------------------- |
| macOS (arm64)   | `autosk-osx-arm64`     |
| Linux (x86_64)  | `autosk-linux-x64`     |

The binary is downloaded from the corresponding GitHub release in [`wierdbytes/autosk`](https://github.com/wierdbytes/autosk/releases), so macOS Gatekeeper treats it as installed locally — no quarantine prompt.

Other platforms (macOS Intel, Linux arm64, Windows) aren't covered yet — they will land once they're wired into CI in the main repo.

## How it stays in sync

Every tagged release in `wierdbytes/autosk` triggers a workflow that recomputes the binary SHA-256 sums and pushes an updated `Formula/autosk.rb` here. There's no manual bookkeeping; if `wierdbytes/autosk` shipped a release, this tap already knows about it.
