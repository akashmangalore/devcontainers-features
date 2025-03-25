#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'debian-ohmyzsh' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "debian-ohmyzsh": {}
#    },
#    "remoteUser": "root"
# }
#
# Thus, the value of all options will fall back to the default value in the
# Feature's 'devcontainer-feature.json'.
# For the 'debian-ohmyzsh' feature, that means:
# - theme: "powerlevel10k/powerlevel10k"
# - plugins: ""
# - installFonts: true
#
# These scripts are run as 'root' by default. Although that can be changed
# with the '--remote-user' flag.
# 
# This test can be run with the following command:
#
#    devcontainer features test    \ 
#               --features debian-ohmyzsh   \
#               --remote-user root \
#               --skip-scenarios   \
#               --base-image mcr.microsoft.com/devcontainers/base:ubuntu \
#               /path/to/this/repo

set -e

source dev-container-features-test-lib

check "oh-my-zsh installation" test -d "$HOME/.oh-my-zsh"
check "powerlevel10k theme installed" test -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
check "zsh is default shell" echo "$SHELL" | grep "/bin/zsh"
check "zshrc configured with theme" grep -q 'ZSH_THEME="powerlevel10k/powerlevel10k"' "$HOME/.zshrc"

reportResults
