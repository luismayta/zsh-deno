#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install deno for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
export DENO_PACKAGE_NAME=deno
export DENO_DOWNLOAD_URL="https://deno.land/x/install/install.sh"

DENO_ROOT_DIR=$(dirname "$0")
DENO_SRC_DIR="${DENO_ROOT_DIR}"/src
export DENO_INSTALL="${HOME}/.deno"


export DENO_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"

# shellcheck source=/dev/null
source "${DENO_SRC_DIR}"/base.zsh

# shellcheck source=/dev/null
source "${DENO_SRC_DIR}"/utils.zsh

# cross::os functions for osx and linux
function cross::os {

    case "${OSTYPE}" in
        darwin*)
            # shellcheck source=/dev/null
            source "${DENO_SRC_DIR}"/darwin.zsh
            ;;
        linux*)
            # shellcheck source=/dev/null
            source "${DENO_SRC_DIR}"/linux.zsh
            ;;
    esac

}

cross::os

# shellcheck source=/dev/null
source "${DENO_SRC_DIR}"/install.zsh

deno::load

deno::install
