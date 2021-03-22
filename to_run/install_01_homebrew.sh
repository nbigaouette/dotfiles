#!/bin/bash

if [[ "`uname`" == "Darwin" ]]; then
    if [[ -x "$(command -v brew)" ]]; then
        echo "Warning: homebrew already installed."
    else
        # https://brew.sh/
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
fi
