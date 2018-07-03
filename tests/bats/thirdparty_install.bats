#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "git submodule install" {
    git_submodule_install ()
    {
        echo "" >&2
        echo -e "${ORG} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Installing the Git Submodules...            |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        git submodule update --init --recursive
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully installed the git submodules.${NOC}\n"
    }
    run git_submodule_install
    [ "${lines[5]}" = "✔ Successfully installed the git submodules." ]
    [ "$status" -eq 0 ]
}

@test "adminer install" {
    adminer_copy ()
    {
        echo "" >&2
        echo -e "${ORG} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Installing the Adminer project...           |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        cp -R ${source}/adminer ${main}/adminer
        ln -s ${main}/adminer ${dist}/adminer
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully copied the Adminer sub-module to ${main}/adminer and created a symbolic link to ${dist}/adminer in the project folder.${NOC}\n"
    }
    run adminer_copy
    [ "${lines[7]}" = "✔ Successfully copied the Adminer sub-module to ${main}/adminer and created a symbolic link to ${dist}/adminer in the project folder." ]
    [ "$status" -eq 0 ]
}

@test "error pages install" {
    errorpages_copy ()
    {
        echo "" >&2
        echo -e "${GRN} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Installing the Apache Error Pages project...|" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        cp -R ${source}/httpd/error-pages/dist/apache ${main}/error-pages
        ln -s ${main}/error-pages ${dist}/error-pages
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully copied the Apache Error Pages sub-module to ${main}/error-pages and created a symbolic link to ${dist}/error-pages in the project folder.${NOC}\n"
    }
    run errorpages_copy
    [ "${lines[7]}" = "✔ Successfully copied the Apache Error Pages sub-module to ${main}/error-pages and created a symbolic link to ${dist}/error-pages in the project folder." ]
    [ "$status" -eq 0 ]
}

@test "phpmyadmin install" {
    phpmyadmin_install ()
    {
        echo "" >&2
        echo -e "${BRO} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Installing the phpMyAdmin project...        |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        mkdir -p ${source}/phpmyadmin
        mkdir -p ${source}/archives
        cd ${source}/archives/
        wget https://files.phpmyadmin.net/phpMyAdmin/4.8.1/phpMyAdmin-4.8.1-all-languages.tar.gz
        tar -zxvf phpMyAdmin-4.8.1-all-languages.tar.gz \
        -C ${source}/phpmyadmin \
        --strip-components=1
        cd ../../
        cp -R ${source}/phpmyadmin ${main}/phpmyadmin
        ln -s ${main}/phpmyadmin ${dist}/phpmyadmin
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully installed the phpMyAdmin sub-module to ${main}/phpmyadmin and created a symbolic link to ${dist}/phpmyadmin in the project folder.${NOC}\n"
    }
    # skip
    run phpmyadmin_install
    [ "$status" -eq 0 ]
}
