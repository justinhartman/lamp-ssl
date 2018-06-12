#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "folder and git setup" {
    folder_and_git ()
    {
        echo "" >&2
        echo -e "${BLU} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Add website folder and initialise git repo. |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        mkdir -p ${websites}/${domain}
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created folder in ${websites}/${domain}.${NOC}\n"
        git init ${websites}/${domain}
        ls -lha ${websites}/${domain}
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created folder and initialised git repo for ${domain}.${NOC}\n"
    }
    run folder_and_git
    [ "${lines[5]}" = "✔ Successfully created folder in ${websites}/${domain}." ]
    [ "${lines[12]}" = "✔ Successfully created folder and initialised git repo for ${domain}." ]
    [ "$status" -eq 0 ]
}
