#!/bin/bash

if [[ command -v exa &> /dev/null ]]; then
    echo "Warning: exa already installed."
else
    cargo install exa
fi

