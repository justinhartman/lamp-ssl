#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "add ssl to keychain certificate" {
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
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully updated the macOS Keychain with a new SSL certificate with ${domain} added.${NOC}\n" >&2
    }
    run keychain_certificate
    [ "${lines[9]}" = "✔ Successfully updated the macOS Keychain with a new SSL certificate with ${domain} added." ]
    [ "$status" -eq 0 ]
}
