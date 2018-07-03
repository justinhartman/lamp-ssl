#!/usr/bin/env bats

setup ()
{
    load globals
}

@test "cleanup test directory and clone project repo" {
    test_directory_delete ()
    {
        rm -Rf ${TMP}/*
        touch ${LOG}
        echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
        git clone --recursive https://gitlab.com/justinhartman/Automated-LAMP-with-trusted-localhost-SSL.git ${GIT}
    }
    # Execute the test
    run test_directory_delete
    [ "$status" -eq 0 ]
}

@test "create test directory structure" {
    test_directory_structure ()
    {
        echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
        mkdir -p ${main}
        mkdir -p ${httpd}
        mkdir -p ${httpd}/extra
        mkdir -p ${websites}
        mkdir -p ${ssl}
        mkdir -p ${etc}
        mkdir -p ${websites}/${domain}
        touch ${hosts}
        touch ${httpd}/httpd.conf
        touch ${httpd}/extra/httpd-ssl.conf
        touch ${httpd}/extra/httpd-vhosts.conf
    }
    # Execute the test
    run test_directory_structure
    [ "$status" -eq 0 ]
}
