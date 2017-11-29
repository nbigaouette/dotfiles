#!/bin/bash

if [[ -x "$(command -v fd)" ]]; then
    echo "Warning: fd already installed."
else
    cargo install fd-find
fi

