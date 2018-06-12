#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "openssl command" {
    openssl_command ()
    {
        echo "" >&2
        echo -e "${GRN} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Create SSL Certificates for the new domain. |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        openssl req -new \
            -key ${ssl}/localhost_server.key \
            -out ${ssl}/localhost_server.csr \
            -subj "/C=$country/ST=$state/L=$city/O=$company/OU=$unit/CN=localhost"

        openssl x509 -req \
            -in ${ssl}/localhost_server.csr \
            -CA ${ssl}/localhost_rootCA.crt \
            -CAkey ${ssl}/localhost_rootCA.key \
            -CAcreateserial \
            -out ${ssl}/localhost_server.crt \
            -days 9125 \
            -sha256 \
            -extfile "${ssl}/openssl.conf"

        ls -lh ${ssl}/localhost_server.c*

        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created SSL certificates for ${domain}.${NOC}\n"
    }

    run openssl_command
    [ "${lines[11]}" = "✔ Successfully created SSL certificates for ${domain}." ]
    [ "$status" -eq 0 ]
}
