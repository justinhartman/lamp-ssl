#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "setup ssl" {
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
        mkdir -p ${ssl}
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created the ssl directory.${NOC}\n\n"

        # Copy the `${source}/ssl/openssl.conf` to ${ssl}.
        cp ${source}/ssl/openssl.conf ${ssl}/

        # create rootCA certificate
        openssl genrsa -out ${ssl}/localhost_rootCA.key 2048
        openssl req -x509 -new -nodes \
            -key ${ssl}/localhost_rootCA.key \
            -days 10950 \
            -out ${ssl}/localhost_rootCA.crt \
            -subj "/C=${country}/ST=${state}/L=${city}/O=${company}/OU=${unit}/CN=${company} Root CA"
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created the ${company} rootCA SSL.${NOC}\n\n"

        # create server key and certificate
        openssl genrsa -out ${ssl}/localhost_server.key 2048
        openssl req -new \
            -key ${ssl}/localhost_server.key \
            -out ${ssl}/localhost_server.csr \
            -subj "/C=${country}/ST=${state}/L=${city}/O=${company}/OU=${unit}/CN=localhost"
        openssl x509 -req \
            -in ${ssl}/localhost_server.csr \
            -CA ${ssl}/localhost_rootCA.crt \
            -CAkey ${ssl}/localhost_rootCA.key \
            -CAcreateserial \
            -out ${ssl}/localhost_server.crt \
            -days 9125 \
            -sha256 \
            -extfile ${ssl}/openssl.conf
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created the localhost SSL.${NOC}\n\n"

        # create client key and certificate
        openssl genrsa -out ${ssl}/localhost_client.key 2048
        openssl req -new \
            -key ${ssl}/localhost_client.key \
            -out ${ssl}/localhost_client.csr \
            -subj "/C=${country}/ST=${state}/L=${city}/O=${company}/OU=${unit}/CN=Client Certificate"
        openssl x509 -req \
            -in ${ssl}/localhost_client.csr \
            -CA ${ssl}/localhost_rootCA.crt \
            -CAkey ${ssl}/localhost_rootCA.key \
            -CAcreateserial \
            -out ${ssl}/localhost_client.crt \
            -days 9125
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created the client SSL.${NOC}\n\n"

        # Create symlink to the SSL folder in dist.
        ln -s ${ssl} dist/ssl
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Created a symbolic link from '${ssl}' to 'dist/ssl'.${NOC}\n\n"
    }
    run setup_ssl
    [ "${lines[7]}" = "✔ Successfully created the ssl directory." ]
    [ "${lines[13]}" = "✔ Successfully created the ${company} rootCA SSL." ]
    [ "${lines[19]}" = "✔ Successfully created the localhost SSL." ]
    [ "${lines[27]}" = "✔ Successfully created the client SSL." ]
    [ "$status" -eq 0 ]
}

@test "add certificates to apple keychain" {
    add_to_keychain ()
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
        -k '/Library/Keychains/System.keychain' ${ssl}/localhost_rootCA.crt
        # Add the localhost certificate, always trust SSL access.
        security add-trusted-cert -d -r trustAsRoot -p ssl \
        -k '/Library/Keychains/System.keychain' ${ssl}/localhost_server.crt
        # Add the client certificate, always trust SSL access.
        security add-trusted-cert -d -r trustAsRoot -p smime \
        -k '/Library/Keychains/System.keychain' ${ssl}/localhost_client.crt
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully added the new Root CA, localhost server and client SSL certificates to the macOS Keychain.${NOC}\n"
    }
    run add_to_keychain
    [ "${lines[10]}" = "✔ Successfully added the new Root CA, localhost server and client SSL certificates to the macOS Keychain." ]
    [ "$status" -eq 0 ]
}

@test "set folder permissions" {
    folder_permissions ()
    {
        echo "" >&2
        echo -e "${GRY} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Setting correct folder permissions to your  |" >&2
        echo "|  user account for the new domain folder.     |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        username=501 && chown -R $username:staff ${ssl}
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully set folder permissions on ${ssl}.${NOC}\n"
    }
    run folder_permissions
    [ "${lines[6]}" = "✔ Successfully set folder permissions on ${ssl}." ]
    [ "$status" -eq 0 ]
}
