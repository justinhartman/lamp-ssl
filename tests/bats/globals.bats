#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "user variables" {
    user_vars ()
    {
        username="$(whoami)"
        group="$(id -gn)"
    }
    run user_vars
    [ "$status" -eq 0 ]
}

@test "ssl variables" {
    ssl_vars ()
    {
        country="ZA"
        state="Western Cape"
        city="Cape Town"
        company="22 Digital"
        unit="Security"
    }
    run ssl_vars
    [ "$status" -eq 0 ]
}

@test "path variables" {
    path_vars ()
    {
        main="${TMP}/usr/local/var/www"
        httpd="${TMP}/usr/local/etc/httpd"
        websites="${TMP}/usr/local/var/www/websites"
        ssl="${TMP}/usr/local/var/www/ssl"
        scripts="${GIT}/scripts"
        source="${GIT}/src"
        dist="${GIT}/dist"
        etc="${TMP}/etc"
        hosts="${TMP}/etc/hosts"
    }
    run path_vars
    [ "$status" -eq 0 ]
}
