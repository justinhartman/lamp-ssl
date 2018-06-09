#!/bin/bash
#
# Sets up the self-signed SSL certificates for Apache 2 and adds them as
# trusted certificates to Apple's Keychain.
# 
# Copyright: Copyright (C) 2018 Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 0.5.0
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
# Link     : https://justin.hartman.me
# Since    : 0.1.0
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
# From https://github.com/thojansen/client-certificates/blob/master/ssl/setup.sh
# 

#######################################
# Sets up the self-signed SSL certs in
# `/usr/local/var/www/ssl/`.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String
#######################################
setup_ssl ()
{
    echo "" >&2
    echo -e "${BRO} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Setting up the self-signed SSL certificates |" >&2
    echo "|  for Apache 2 and adding them to Apple's     |" >&2
    echo "|  Keychain as trusted SSL certificates.       |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2

    # Create the SSL directory.
    mkdir -p $ssl
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created the ssl directory.${NOC}\n\n"

    # Copy the `$source/ssl/openssl.conf` to $ssl.
    cp $source/ssl/openssl.conf $ssl/

    # create rootCA certificate
    openssl genrsa -out $ssl/localhost_rootCA.key 2048
    openssl req -x509 -new -nodes \
        -key $ssl/localhost_rootCA.key \
        -days 10950 \
        -out $ssl/localhost_rootCA.crt \
        -subj "/C=$country/ST=$state/L=$city/O=$company/OU=$unit/CN=$company Root CA"
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created the $company rootCA SSL.${NOC}\n\n"

    # create server key and certificate
    openssl genrsa -out $ssl/localhost_server.key 2048
    openssl req -new \
        -key $ssl/localhost_server.key \
        -out $ssl/localhost_server.csr \
        -subj "/C=$country/ST=$state/L=$city/O=$company/OU=$unit/CN=localhost"
    openssl x509 -req \
        -in $ssl/localhost_server.csr \
        -CA $ssl/localhost_rootCA.crt \
        -CAkey $ssl/localhost_rootCA.key \
        -CAcreateserial \
        -out $ssl/localhost_server.crt \
        -days 9125 \
        -sha256 \
        -extfile $ssl/openssl.conf
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created the localhost SSL.${NOC}\n\n"

    # create client key and certificate
    openssl genrsa -out $ssl/localhost_client.key 2048
    openssl req -new \
        -key $ssl/localhost_client.key \
        -out $ssl/localhost_client.csr \
        -subj "/C=$country/ST=$state/L=$city/O=$company/OU=$unit/CN=Client Certificate"
    openssl x509 -req \
        -in $ssl/localhost_client.csr \
        -CA $ssl/localhost_rootCA.crt \
        -CAkey $ssl/localhost_rootCA.key \
        -CAcreateserial \
        -out $ssl/localhost_client.crt \
        -days 9125
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created the client SSL.${NOC}\n\n"

    # Create symlink to the SSL folder in dist.
    ln -s $ssl dist/ssl
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Created a symbolic link from '$ssl' to 'dist/ssl'.${NOC}\n\n"
}

#######################################
# Adds the certificates as trusted SSL
# to Apple's Keychain.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String
#######################################
addto_keychain ()
{
    echo "" >&2
    echo -e "${BRO} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Adding certificates to Apple's Keychain as  |" >&2
    echo "|  trusted SSL certificates.                   |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    # Add the rootCA certificate first, grant all access.
    security add-trusted-cert -d -r trustRoot \
    -k '/Library/Keychains/System.keychain' $ssl/localhost_rootCA.crt
    # Add the localhost certificate, always trust SSL access.
    security add-trusted-cert -d -r trustAsRoot -p ssl \
    -k '/Library/Keychains/System.keychain' $ssl/localhost_server.crt
    # Add the client certificate, always trust SSL access.
    security add-trusted-cert -d -r trustAsRoot -p smime \
    -k '/Library/Keychains/System.keychain' $ssl/localhost_client.crt
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully updated the macOS
  Keychain with the new SSL certificate.${NOC}\n"
}

#######################################
# Sets the permissions on the website
# folder to the current macOS user.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
folder_permissions ()
{
    echo "" >&2
    echo -e "${GRY} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Setting correct folder permissions to your  |" >&2
    echo "|  user account for the new domain folder.     |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    username=501 && chown -R $username:staff $ssl
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully set folder permissions
  on $ssl.${NOC}\n"
}

setup_ssl
addto_keychain
folder_permissions
