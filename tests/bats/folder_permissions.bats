#!/usr/bin/env bats

setup ()
{
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "change file and folder ownership" {
    folder_ownership ()
    {
        echo "" >&2
        echo -e "${GRY} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Setting correct folder permissions to your  |" >&2
        echo "|  user account for the application folders.   |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        chown -R ${username}:${group} ${main}
        chown -R ${username}:${group} ${httpd}
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully set folder permissions recursively on ${main} and ${httpd}.${NOC}\n"
    }
    # Execute the tests
    run folder_ownership
    [ "${lines[6]}" = "✔ Successfully set folder permissions recursively on ${main} and ${httpd}." ]
    [ "$status" -eq 0 ]
}
