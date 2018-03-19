#!/bin/bash

if [[ "`uname`" == "Darwin" ]]; then
    if [[ -x "$(command -v brew)" ]]; then
        echo "Warning: homebrew already installed."
    else
        # https://brew.sh/
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
fi
