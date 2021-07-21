#!/usr/bin/env bash
# cd $(dirname $0)

cd $(pwd)/scripts
find . -type f -perm -111 -exec bash -n '{}' \;

# load globals

# find . -type f -name '_setup.bats' -exec sh '{}' \;
# find scripts -type f -perm -111 -exec sh '{}' \;
# find . -type f -name '*.bats' -exec sh '{}' \;

# cd $(pwd)/scripts
# find . -type f -name '*.sh'

# load tests/bats/globals.bash
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

bash ../tests/lamp-add
bash ../tests/lamp-upgrade
bash ./apache_config.sh
bash ./colour_palette.sh
bash ./enter_domain.sh
bash ./folder_and_git.sh
bash ./folder_ownership.sh
bash ./git_setup.sh
bash ./globals.sh
bash ./hosts_domain.sh
bash ./hosts_file.sh
bash ./keychain_certificate.sh
bash ./openssl_command.sh
bash ./openssl_config.sh
bash ./restart_apache.sh
bash ./setup_ssl.sh
bash ./thirdparty_install.sh
bash ./upgrade_software.sh
bash ./website_folder_ownership.sh

rm -rf "${TMP}"
