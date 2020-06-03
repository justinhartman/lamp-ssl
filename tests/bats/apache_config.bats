#!/usr/bin/env bats

setup ()
{
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "apache file backup" {
    file_backup ()
    {
        echo "" >&2
        echo -e "${GRY} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Backing up old Apache config files.         |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        mv ${httpd}/httpd.conf ${httpd}/httpd.conf.original
        mv ${httpd}/extra/httpd-ssl.conf ${httpd}/extra/httpd-ssl.conf.original
        mv ${httpd}/extra/httpd-vhosts.conf ${httpd}/extra/httpd-vhosts.conf.original
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully backed up the Apache 2 configuration files.${NOC}\n"
    }
    # Execute the test
    run file_backup
    [ "${lines[7]}" = "✔ Successfully backed up the Apache 2 configuration files." ]
    [ "$status" -eq 0 ]
}

@test "apache copy files" {
    copy_files ()
    {
        echo "" >&2
        echo -e "${GRY} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Copying new Apache config files over...     |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        cp ${source}/httpd/conf/httpd.conf ${httpd}/
        cp ${source}/httpd/conf/httpd-ssl.conf ${httpd}/extra/
        cp ${source}/httpd/conf/httpd-vhosts.conf ${httpd}/extra/
        cp ${source}/httpd/extra/httpd-custom-alias.conf ${httpd}/extra/
        cp ${source}/httpd/extra/httpd-custom-directory.conf ${httpd}/extra/
        cp ${source}/httpd/extra/httpd-custom-error-pages.conf ${httpd}/extra/
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully copied the new Apache 2 configuration files.${NOC}\n"
    }
    # Execute the test
    run copy_files
    [ "${lines[10]}" = "✔ Successfully copied the new Apache 2 configuration files." ]
    [ "$status" -eq 0 ]
}

@test "apache final configuration" {
    final_configuration ()
    {
        mkdir -p ${websites} # Create default web root
        ln -s ${websites} ${dist}/websites
        ln -s ${httpd} ${dist}/apache
        brew services restart httpd # (Re)start Apache
        echo -e "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Your website folder has been created at ${websites} and you can edit your files in the 'dist' folder.${NOC}\n"
    }
    # Execute the test
    run final_configuration
    [ "${lines[7]}" = "✔ Your website folder has been created at ${websites} and you can edit your files in the 'dist' folder." ]
    [ "$status" -eq 0 ]
}
