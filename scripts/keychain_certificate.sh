#!/bin/bash
#
# Adds the updated server certificate to macOS' Keychain.
# 
# Copyright: Copyright (C) 2018 Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 0.5.0
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
# Link     : https://justin.hartman.me
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
# Adds the updated server certificate
# to macOS' Keychain.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
keychain_certificate ()
{
    echo "" >&2
    echo -e "${BRO} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Adding new SSL cert to macOS' Keychain so   |" >&2
    echo "|  that you don't get browser errors when      |" >&2
    echo "|  accessing your new domain over https.       |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    security add-trusted-cert -d -r trustAsRoot -p ssl \
    -k '/Library/Keychains/System.keychain' $ssl/localhost_server.crt
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully updated the macOS
  Keychain with a new SSL certificate with ${domain} added.${NOC}\n"
}

keychain_certificate
