#!/usr/bin/env bats

setup ()
{
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "git setup" {
    git_setup ()
    {
        echo "" >&2
        echo -e "${PUR} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  git initial structure, files and check-in.  |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        cp -R ${source}/git/templates/_core ${websites}/${domain}
        cp ${source}/git/templates/_licenses/mit.txt ${websites}/${domain}/LICENSE
        ls -lha ${websites}/${domain}
        cd ${websites}/${domain}
        git add -A
        git commit -m "Created git structure, .github template and initial project commit."
        echo "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created files and${NOC}"
        echo "${CYA}committed changes.${NOC}\n"
    }
    run git_setup
    [ "${lines[13]}" = "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully created files and${NOC}" ]
    [ "${lines[14]}" = "${CYA}committed changes.${NOC}\n" ]
    [ "$status" -eq 0 ]
}
