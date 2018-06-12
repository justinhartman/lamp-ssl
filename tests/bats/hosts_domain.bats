#!/usr/bin/env bats

setup ()
{
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "hosts file domain insert" {
    hosts_domain ()
    {
        echo "" >&2
        echo -e "${WHT} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Add new domain to hosts file.               |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        echo "127.0.0.1       ${domain}" >> ${hosts}
        cat ${hosts} | grep "${domain}"
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully added ${domain} to ${hosts} file.${NOC}\n"
    }
    run hosts_domain
    [ "${lines[7]}" = "✔ Successfully added ${domain} to ${hosts} file." ]
    [ "$status" -eq 0 ]
}
