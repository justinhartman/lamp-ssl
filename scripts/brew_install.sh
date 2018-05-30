#!/bin/bash
#
# Fully automated LAMP installation and configuration using Trusted localhost 
# SSL Certificates
# 
# Copyright: Copyright (C) 2018 Justin Hartman (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 0.4.1
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
# Link     : https://justin.hartman.me
# Since    : 0.2.0
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
# 

#######################################
# This asks the user if they have
# Homebrew or not and waits for a Y or
# N answer.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   Void
#######################################
brew_start ()
{
    echo "" >&2
    echo -e "${RED} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Do you have Homebrew installed on           |" >&2
    echo "|  your Apple macOS computer (Y/n)?            |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    echo -n ""
    read answer
}

#######################################
# This installs Homebrew (`brew`) but
# only if the user hasn't got it and
# wants to install it via the script.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   Void
#######################################
brew_install ()
{
    echo "" >&2
    echo -e "${RED} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Installing Homebrew.                        |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    echo "" >&2
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully installed Homebrew.${NOC}\n"
}

#######################################
# Installs the packages required from
# `brew` running `brew install`.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   Void
#######################################
brew_packages ()
{
    echo "" >&2
    echo -e "${RED} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Installing Apache 2 and PHP.                |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    brew install php httpd
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully installed Apache 2
  and PHP.${NOC}\n"
}

brew_start

if [ "$answer" != "${answer#[Nn]}" ] ;then
    brew_install
    brew_packages
else
    echo "" >&2
    echo -e "${RED} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  OK, we're not installing Homebrew so lets   |" >&2
    echo "|  proceed with installing the PHP and         |" >&2
    echo "|  Apache 2 packages. Give me a minute.        |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    brew_packages
fi
