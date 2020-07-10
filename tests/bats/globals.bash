#!/bin/bash

test_global_vars() {
    NOW=$(date)
    # TMP="${TMPDIR}"
    TMP="/usr/local/tmp"
    GIT="${TMP}/lamp-ssl"
    LOG="${TMP}/test_install.log"

    domain="www.test.localhost"

    username="$(whoami)"
    group="$(id -gn)"

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

    export NOW TMP GIT LOG domain username group country state city company unit main httpd php websites ssl scripts source dist etc hosts
}

test_global_vars
