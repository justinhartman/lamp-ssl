#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "openssl configuration" {
    openssl_config ()
    {
        echo "" >&2
        echo -e "${ORG} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Add domain to 'openssl.conf' configuration  |" >&2
        echo "|  file.                                       |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        read serial <<< $(wc -l < ${ssl}/openssl.conf | tr -d ' ')
        serial=$((serial-11))
        echo "DNS.${serial}      =   ${domain}" >> ${ssl}/openssl.conf
        cat ${ssl}/openssl.conf | grep "DNS"
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully added ${domain} to the openssl configuration file.${NOC}\n"
    }
    run openssl_config
    [ "${lines[9]}" = "✔ Successfully added ${domain} to the openssl configuration file." ]
    [ "$status" -eq 0 ]
}
