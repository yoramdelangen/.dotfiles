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

## Setup Karabiner-Elements
Making sure the damnn capslock is being remapped, and without moving so make capslock together with `hjkl` the arrow keys VIM style.

`Complex Modifications > Add your own rule`

```json
{
    "description": "CAPS › ESC, CAPS+H/J/K/L › ←↓↑→, CAPS+D/U › PG↓↑",
    "manipulators": [
        {
            "conditions": [
                {
                    "name": "caps_lock pressed",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "j",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "down_arrow"
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "caps_lock pressed",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "k",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "up_arrow"
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "caps_lock pressed",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "h",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "left_arrow"
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "caps_lock pressed",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "l",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "right_arrow"
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "caps_lock pressed",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "d",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "page_down"
                }
            ],
            "type": "basic"
        },
        {
            "conditions": [
                {
                    "name": "caps_lock pressed",
                    "type": "variable_if",
                    "value": 1
                }
            ],
            "from": {
                "key_code": "u",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "page_up"
                }
            ],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "caps_lock",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "set_variable": {
                        "name": "caps_lock pressed",
                        "value": 1
                    }
                }
            ],
            "to_after_key_up": [
                {
                    "set_variable": {
                        "name": "caps_lock pressed",
                        "value": 0
                    }
                }
            ],
            "to_if_alone": [
                {
                    "key_code": "escape"
                }
            ],
            "type": "basic"
        }
    ]
}
```

## Orbstack aka Docker

This tool is a replacement and can do Docker, and Linux containers.

- `node`, `yarn` and other Javascript related commands should be replaced with a "container".

## Rectangle

Setup should be like this:
.. image 1 ..
.. image 2 ..

## Databases

For databases checkout [this](./docs/databases.md) documentation.
