#!/usr/bin/env bats

setup ()
{
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "test no cancels upgrade to packages" {
    cancel_upgrades() {
        printf "${RED}%s\\n" "${TOP}"
        printf '* %-76s %s\n' "Do you want to upgrade this project and all the sub-modules linked to it (Y/n)?" "*"
        printf "%s${NOC}\\n\\n" "${BOTTOM}"
        echo -n "" >&2

        answer=n

        if [ "$answer" != "${answer#[Yy]}" ]; then
            echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully upgraded the core and all related sub-modules.${NOC}\\n"
        else
            printf "${RED}%s\\n" "${TOP}"
            printf '* %-76s %s\n' "OK, we are not going to upgrade any of the software!" "*"
            printf '* %-76s %s\n' "Please note, however, you should keep all software up to date." "*"
            printf '* %-76s %s\n' "Using up to date files ensures you benefit from bug fixes and enhancements." "*"
            printf '* %-76s %s\n' "You should reconsider and make sure to update frequently." "*"
            printf "%s${NOC}\\n\\n" "${BOTTOM}"
        fi
    }
    run cancel_upgrades
    [ "$status" -eq 0 ]
    [ "${lines[1]}" = "* OK, we are not going to upgrade any of the software!                         *" ]
}

@test "test yes starts and completes the upgrade of packages" {
    confirm_upgrade() {
        printf "${RED}%s\\n" "${TOP}"
        printf '* %-76s %s\n' "Do you want to upgrade this project and all the sub-modules linked to it (Y/n)?" "*"
        printf "%s${NOC}\\n\\n" "${BOTTOM}"
        echo -n "" >&2

        answer=y

        if [ "$answer" != "${answer#[Yy]}" ]; then
            echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully upgraded the core and all related sub-modules.${NOC}\\n"
        else
            printf "${RED}%s\\n" "${TOP}"
            printf '* %-76s %s\n' "OK, we are not going to upgrade any of the software!" "*"
            printf '* %-76s %s\n' "Please note, however, you should keep all software up to date." "*"
            printf '* %-76s %s\n' "Using up to date files ensures you benefit from bug fixes and enhancements." "*"
            printf '* %-76s %s\n' "You should reconsider and make sure to update frequently." "*"
            printf "%s${NOC}\\n\\n" "${BOTTOM}"
        fi
    }
    run confirm_upgrade
    [ "$status" -eq 0 ]
    [ "${lines[1]}" = "✔ Successfully upgraded the core and all related sub-modules." ]
}

@test "upgrade adminer and apache error pages projects" {
    upgrade_projects() {
        printf "${ORG}%s\\n" "${TOP}"
        printf '* %-76s %s\n' "Checking for upgrades to the core..." "*"
        printf "%s${NOC}\\n\\n" "${BOTTOM}"
        git pull origin master
        echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully updated the core project.${NOC}\\n"
        printf "${ORG}%s\\n" "${TOP}"
        printf '* %-76s %s\n' "Checking for upgrades to the Adminer, GitHub and Apache Error Pages projects..." "*"
        printf "%s${NOC}\\n\\n" "${BOTTOM}"
        git submodule update --init --recursive --remote
        echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully updated all the git submodules.${NOC}\\n"
        printf "${ORG}%s\\n" "${TOP}"
        printf '* %-76s %s\n' "Copying new files to their correct folder locations..." "*"
        printf "%s${NOC}\\n\\n" "${BOTTOM}"
        cp -R "${source}"/httpd/error-pages/dist/apache/* "${main}"/error-pages/
        cp -R "${source}"/adminer/* "${main}"/adminer/
        echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully copied across all the new files.${NOC}\\n"
    }
    run upgrade_projects
    [ "${lines[4]}" = "✔ Successfully updated the core project." ]
    [ "${lines[6]}" = "✔ Successfully updated all the git submodules." ]
    [ "${lines[10]}" = "✔ Successfully copied across all the new files." ]
    [ "$status" -eq 0 ]
}
