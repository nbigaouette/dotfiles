#!/bin/bash

if [[ command -v rg &> /dev/null ]]; then
    echo "Warning: ripgrep already installed."
else
    cargo install ripgrep
fi

