#!/bin/bash

set -e
set -o nounset

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INSTALL_DIR="${INSTALL_DIR:-${HOME}}"

SCRIPT_DIR_REL=${SCRIPT_DIR#"${HOME}/"}

function run_cmd() {
    cmd="${@}"
    echo ${cmd}
    eval ${cmd}
}


pushd ${SCRIPT_DIR}


pushd to_link

# Normal files
files_list=($(find * -type f -print))
# Symbolic links
files_list+=($(find * -type l -print))

popd


for f in ${files_list[*]}; do
    new_dot_file="${INSTALL_DIR}/.${f}"
    new_dir="$(dirname ${new_dot_file})"

    mkdir -p ${new_dir}

    link_type="-s"  # Symbolic link
    # link_type=""  # Hard link

    if [[ -f ${new_dot_file} ]]; then
        echo "WARNING: File ${new_dot_file} already exists. Skipping."
    else
        if [[ -L ${new_dot_file} ]]; then
            echo "WARNING: Symbolic link ${new_dot_file} already exists. Overwriting."
            rm -f ${new_dot_file}
        fi
        cmd="ln ${link_type} ${SCRIPT_DIR_REL}/to_link/${f} ${new_dot_file}"
        run_cmd ${cmd}
    fi
done



pushd to_append

# Normal files
files_list=($(find * -type f -print))

popd


for f in ${files_list[*]}; do
    append_dot_file="${INSTALL_DIR}/.${f}"
    append_dir="$(dirname ${new_dot_file})"

    read -p "About to append 'to_append/${f}' to ${append_dot_file}. Proceed? [y/N] " answer
    case ${answer} in
        [Yy] ) ;;
        * ) echo "Skipping."; continue;;
    esac

    cmd="mkdir -p ${append_dir}"
    run_cmd ${cmd}

    cmd="cat to_append/${f} >> ${append_dot_file}"
    run_cmd ${cmd}
done



pushd to_run

# Normal files
files_list=($(find * -type f -print))

popd


export INSTALL_DIR=${INSTALL_DIR}

for f in ${files_list[*]}; do
    read -p "About to execute 'to_run/${f}'. Proceed? [y/N] " answer
    case ${answer} in
        [Yy] ) ;;
        * ) echo "Skipping."; continue;;
    esac

    cmd="${SCRIPT_DIR}/to_run/${f}"
    run_cmd ${cmd}
done
