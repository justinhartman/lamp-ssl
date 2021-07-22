#!/bin/bash
#
# Adds the updated server certificate to macOS' Keychain.
#
# Copyright: Copyright 2018-2020 Justin Hartman (https://justinhartman.co)
# Author   : Justin Hartman <code@justinhartman.co> (https://justinhartman.co)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.2.2
# Link     : https://github.com/justinhartman/lamp-ssl
# Since    : 0.4.0
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
#

#######################################
# Removes any server certificates
# from macOS' Keychain.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
remove_keychain_certificate() {
    printf "${BRO}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Removing old SSL certificates from macOS' Keychain." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    security delete-certificate -c localhost '/Library/Keychains/System.keychain'
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully removed any old certificates from the macOS Keychain.${NOC}\\n" >&2
}

#######################################
# Adds the updated server certificate
# to macOS' Keychain.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
add_keychain_certificate() {
    printf "${BRO}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Adding new SSL cert to macOS' Keychain so that you don't get browser" "*"
    printf '* %-76s %s\n' "errors when accessing your new domain over https." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    security add-trusted-cert -d -r trustAsRoot -p ssl \
        -k '/Library/Keychains/System.keychain' "$ssl"/localhost_server.crt
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully updated the macOS Keychain with a new SSL certificate with ${domain} added.${NOC}\\n" >&2
}

#######################################
# Run the methods.
#######################################
remove_keychain_certificate
add_keychain_certificate
