#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function deno::load {
    [ -e "${DENO_INSTALL}/bin" ] && export PATH="${DENO_INSTALL}/bin:${PATH}"
}


function deno::install {
    if type -p deno > /dev/null; then
        return
    fi
    message_info "Installing ${DENO_PACKAGE_NAME}"
    curl -fsSL "${DENO_DOWNLOAD_URL}" | sh
    message_info "Installed ${DENO_PACKAGE_NAME}"
}
