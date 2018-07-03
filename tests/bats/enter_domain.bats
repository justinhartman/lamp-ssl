#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "enter domain name" {
    enter_domain ()
    {
        echo -e "${RED} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  The Aston Martin of perfect LAMP setups     |" >&2
        echo "|  and configuration; automating the entire    |" >&2
        echo "|  process and managing your localhost SSL     |" >&2
        echo "|  using trusted self-signed CA certificates.  |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        echo "Enter the domain name to be added " >&2
        domain="www.test.localhost"
    }
    run enter_domain
    [ "${lines[8]}" = "Enter the domain name to be added " ]
    [ "$status" -eq 0 ]
}
