#!/bin/bash

if [[ -x "$(command -v rg)" ]]; then
    echo "Warning: ripgrep already installed."
else
    cargo install ripgrep
fi

