#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "global includes" {
    global_includes ()
    {
        source scripts/globals.sh
        source scripts/colour_palette.sh
    }
    run global_includes
    [ "$status" -eq 0 ]
}

@test "brew start" {
    brew_start ()
    {
        echo "" >&2
        echo -e "${RED} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Do you have Homebrew installed on           |" >&2
        echo "|  your Apple macOS computer (Y/n)?            |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        # echo -n ""
        # read answer
        answer="n"
    }
    run brew_start
    [ "$status" -eq 0 ]
}

@test "brew install" {
    brew_install ()
    {
        echo "" >&2
        echo -e "${RED} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Installing Homebrew.                        |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        echo "" >&2
        # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        echo "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully installed Homebrew.${NOC}\n"
    }
    # skip
    run brew_install
    [ "${lines[5]}" = "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully installed Homebrew.${NOC}\n" >&2 ]
    [ "$status" -eq 0 ]
}

@test "brew packages" {
    brew_packages ()
    {
        echo "" >&2
        echo -e "${RED} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Installing Apache 2, MySQL and PHP.         |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        brew install httpd mysql php
        echo "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully installed Apache 2,
    MySQL and PHP.${NOC}\n"
    }
    # skip
    run brew_packages
    [ "${lines[11]}" = "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully installed Apache 2," ]
    [ "$status" -eq 0 ]
}

@test "brew startup" {
    brew_startup ()
    {
        echo "" >&2
        echo -e "${RED} ----------------------------------------------" >&2
        echo "|                                              |" >&2
        echo "|  Starting Apache 2, MySQL and PHP.           |" >&2
        echo "|                                              |" >&2
        echo -e " ---------------------------------------------- ${NOC}\n" >&2
        brew services start httpd
        brew services start mysql
        brew services start php
        echo "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully started Apache 2,
    MySQL and PHP.${NOC}\n"
    }
    # skip
    run brew_startup
    [ "${lines[8]}" = "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully started Apache 2," ]
    [ "$status" -eq 0 ]
}
