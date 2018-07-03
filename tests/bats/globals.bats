#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "user variables" {
    user_vars ()
    {
        username="501"
        group="staff"
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
        main="/usr/local/var/www"
        httpd="/usr/local/etc/httpd"
        websites="/usr/local/var/www/websites"
        ssl="/usr/local/var/www/ssl"
        scripts="./scripts"
        source="./src"
        dist="./dist"
    }
    run path_vars
    [ "$status" -eq 0 ]
}
