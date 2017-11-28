#!/bin/bash

if [[ -x "$(command -v tokei)" ]]; then
    echo "Warning: tokei already installed."
else
    cargo install tokei
fi

