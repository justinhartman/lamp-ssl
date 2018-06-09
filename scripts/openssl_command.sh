#!/bin/bash
#
# Creates new SSL certificates for the new domain name.
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
# Creates new SSL certificates for the
# new domain name.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
openssl_command ()
{
    echo "" >&2
    echo -e "${GRN} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Create SSL Certificates for the new domain. |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    openssl req -new \
        -key $ssl/localhost_server.key \
        -out $ssl/localhost_server.csr \
        -subj "/C=ZA/ST=Western Cape/L=Cape Town/O=22 Digital/OU=Security/CN=localhost"

    openssl x509 -req \
        -in $ssl/localhost_server.csr \
        -CA $ssl/localhost_rootCA.crt \
        -CAkey $ssl/localhost_rootCA.key \
        -CAcreateserial \
        -out $ssl/localhost_server.crt \
        -days 9125 \
        -sha256 \
        -extfile "$ssl/openssl.conf"

    ls -lh $ssl/localhost_server.c*

    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created SSL
  certificates for ${domain}.${NOC}\n"
}

openssl_command
