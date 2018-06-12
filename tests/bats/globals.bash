#!/bin/bash

test_global_vars () {
    NOW=$(date)
    # TMP="${BATS_TMPDIR}"
    # GIT="${TMP}/automated-lamp"
    TMP="/usr/local/tmp"
    GIT="${TMP}/automated-lamp"
    LOG="${TMP}/test_install.log"

    domain="www.test.localhost"

    username="501"
    group="staff"

    country="ZA"
    state="Western Cape"
    city="Cape Town"
    company="22 Digital"
    unit="Security"

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

test_global_vars
