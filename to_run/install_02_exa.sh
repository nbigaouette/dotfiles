#!/bin/bash

if [[ -x "$(command -v exa)" ]]; then
    echo "Warning: exa already installed."
else
    cargo install exa
fi

