#!/bin/bash
#
# Creates new SSL certificates for the new domain name.
#
# Copyright: Copyright 2018-2020 Justin Hartman (https://hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.2.0
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
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
# Creates new SSL certificates for the
# new domain name.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
openssl_command() {
    printf "${GRN}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Create SSL Certificates for the new domain..." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    openssl req -new \
        -key "${ssl}"/localhost_server.key \
        -out "${ssl}"/localhost_server.csr \
        -subj "/C=$country/ST=$state/L=$city/O=$company/OU=$unit/CN=localhost"

    openssl x509 -req \
        -in "${ssl}"/localhost_server.csr \
        -CA "${ssl}"/localhost_rootCA.crt \
        -CAkey "${ssl}"/localhost_rootCA.key \
        -CAcreateserial \
        -out "${ssl}"/localhost_server.crt \
        -days 9125 \
        -sha256 \
        -extfile "${ssl}"/openssl.conf

    ls -lh "${ssl}"/localhost_server.c*

    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully created SSL certificates for ${domain}.${NOC}\\n"
}

#######################################
# Run the method.
#######################################
openssl_command
