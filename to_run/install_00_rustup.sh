#!/bin/bash

if [[ -x "$(command -v rustup)" ]]; then
    echo "Warning: Rustup already installed."
else
    # https://rustup.rs/
    curl https://sh.rustup.rs -sSf | sh
fi

cmd="rustup component add rustfmt-preview"
echo ${cmd}
${cmd}

cmd="rustup component add rls-preview rust-analysis rust-src"
echo ${cmd}
${cmd}

