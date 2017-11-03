#!/bin/bash

if [[ command -v rustup &> /dev/null ]]; then
    echo "Warning: Rustup already installed."
else
    # https://rustup.rs/
    curl https://sh.rustup.rs -sSf | sh
fi

