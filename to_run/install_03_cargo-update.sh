#!/bin/bash


if [[ -x "$(command -v cargo-install-update)" ]]; then
    echo "Warning: cargo-update already installed."
else
    // https://github.com/nabijaczleweli/cargo-update
    cmd="cargo install cargo-update"
    echo ${cmd}
    ${cmd}
fi

