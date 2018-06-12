#!/usr/bin/env bats

setup ()
{
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "upgrade adminer and apache error pages projects" {
    upgrade_projects ()
    {
        echo "" >&2
        echo -e "${ORG} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Checking for upgrades to the core...        |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        cd ${GIT}
        git pull
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully updated the core project.${NOC}\n"
        echo "" >&2
        echo -e "${ORG} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Checking for upgrades to the Adminer,       |" >&2
        echo "|  GitHub and Apache Error Pages projects...   |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        git submodule update --init --recursive
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully updated all the git submodules.${NOC}\n"
        echo "" >&2
        echo -e "${ORG} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Copying any new files to their correct      |" >&2
        echo "|  folder locations...                         |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        cp -R ${source}/httpd/error-pages/dist/apache ${main}/error-pages
        cp -R ${source}/adminer ${main}/adminer
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully copied across all the new files.${NOC}\n"
    }
    run upgrade_projects
    [ "${lines[6]}" = "✔ Successfully updated the core project." ]
    [ "${lines[13]}" = "✔ Successfully updated all the git submodules." ]
    [ "${lines[20]}" = "✔ Successfully copied across all the new files." ]
    [ "$status" -eq 0 ]
}
