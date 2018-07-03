#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "hosts file backup" {
    hosts_file_backup ()
    {
        echo "" >&2
        echo -e "${BRO} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Backup original hosts file ${hosts}       |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        cp ${hosts} ${dist}/hosts/hosts.original
        echo -e "${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully backed up hosts file.${NOC}\n" >&2
    }
    run hosts_file_backup
    [ "${lines[6]}" = "✔ Successfully backed up hosts file." ]
    [ "$status" -eq 0 ]
}

@test "hosts symbolic link" {
    hosts_symbolic ()
    {
        echo "" >&2
        echo -e "${GRY} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Create symbolic link for ${hosts} to      |" >&2
        echo "|  point to 'dist/hosts/hosts' file.           |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        ln -s ${hosts} ${dist}/hosts/hosts
        ls -lh ${dist}/hosts/hosts
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created symbolic link from ${hosts} to ${dist}/hosts/hosts.${NOC}\n" >&2
    }
    run hosts_symbolic
    [ "${lines[8]}" = "✔ Successfully created symbolic link from ${hosts} to ${dist}/hosts/hosts." ]
    [ "$status" -eq 0 ]
}
