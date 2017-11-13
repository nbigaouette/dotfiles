#!/bin/bash

if [[ -x "$(command -v rustup)" ]]; then
    echo "Warning: Rustup already installed."
else
    # https://rustup.rs/
    curl https://sh.rustup.rs -sSf | sh
fi

