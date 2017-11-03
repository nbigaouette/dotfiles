#!/bin/sh

# fzf is a general-purpose command-line fuzzy finder.
# https://github.com/junegunn/fzf/

# Installation steps taken from
# https://github.com/junegunn/fzf/#using-git

set -e

INSTALL_DIR="${INSTALL_DIR:-${HOME}}"

git clone --depth 1 https://github.com/junegunn/fzf.git ${INSTALL_DIR}/.fzf
${INSTALL_DIR}/.fzf/install

