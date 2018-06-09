#!/bin/bash
#
# Apache 2.4 Setup and Configuration
# 
# Copyright: Copyright (C) 2018 Justin Hartman (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 0.5.1
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
# Link     : https://justin.hartman.me
# Since    : 0.3.0
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
# Back up httpd.conf, httpd-ssl.conf
# and httpd-vhosts.conf
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
file_backup ()
{
    echo "" >&2
    echo -e "${GRY} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Backing up old Apache config files.         |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    mv $httpd/httpd.conf $httpd/httpd.conf.bak
    mv $httpd/extra/httpd-ssl.conf $httpd/extra/httpd-ssl.conf.bak
    mv $httpd/extra/httpd-vhosts.conf $httpd/extra/httpd-vhosts.conf.bak
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully backed up the Apache 2
  configuration files.${NOC}\n"
}

#######################################
# Copy over new Apache config files.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
copy_files ()
{
    echo "" >&2
    echo -e "${GRY} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Copying new Apache config files over...     |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    cp $source/httpd/conf/httpd.conf $httpd/
    cp $source/httpd/conf/httpd-ssl.conf $httpd/extra/
    cp $source/httpd/conf/httpd-vhosts.conf $httpd/extra/
    cp $source/httpd/extra/httpd-custom-alias.conf $httpd/extra/
    cp $source/httpd/extra/httpd-custom-directory.conf $httpd/extra/
    cp $source/httpd/extra/httpd-custom-error-pages.conf $httpd/extra/
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully copied the new Apache 2
  configuration files.${NOC}\n"
}

#######################################
# Create website folder and restart
# Apache.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
final_steps ()
{
    mkdir -p $websites # Create default web root
    apachectl restart # (Re)start Apache
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Your website folder has been 
created at $websites
and Apache has been successfully restarted.${NOC}\n"
}

file_backup
copy_files
final_steps
