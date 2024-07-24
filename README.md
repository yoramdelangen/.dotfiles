# Dotfiles (2024)

My new setup on MacOS.

## Terminal & Shell

- zsh (shell)
- Starship.sh (Prompt)
- Wezterm (Terminal)
- Homenbrew
- Tmux
- Neovim

## Tools

- karabiner-elements
- 1Password

## Browsers

- Brave
- ArcBrowser

## Devtools

- Golang
- Rust
- Gleam
- Orbstack, replacement for Docker

## Brew

```bash
# Casked recipts
brew install --cask \
    brave-browser \
    arc \
    karabiner-elements \
    orbstack \
    whatsapp \
    figma

# Non-cask
brew install \
    tmux \
    neovim \
    starship \
    git \
    golang \
    rustup \
    x86_64-linux-gnu-binutils \
    messense/macos-cross-toolchains/x86_64-unknown-linux-gnu \
    gleam \
    raycast \
    rectangle \
    lazygit \
    spotify \
    tart \
    wget \
    fzf \
    ripgrep \
    biome \
    FiloSottile/musl-cross/musl-cross \
    bun \
    surrealdb/tap/surreal \
    surrealist
```

## Programming languages

- Go
- Rust
- Gleam
- PHP (using Herd)

## Setup tools

- [docs/karabiner-elements.md](Karbiner-Elements)..

## Orbstack aka Docker

This tool is a replacement and can do Docker, and Linux containers.

- `node`, `yarn` and other Javascript related commands should be replaced with a "container".

## Rectangle

Setup should be like this:
.. image 1 ..
.. image 2 ..

## Databases

For databases checkout [this](./docs/databases.md) documentation.
