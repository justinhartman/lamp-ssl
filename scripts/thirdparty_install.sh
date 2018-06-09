#!/bin/bash
#
# Fetches all third-party sub-modules and installs them in place.
# 
# Copyright: Copyright (C) 2018 Justin Hartman (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 0.5.1
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
# Installs the Adminer project by
# checking out the source code to
# `/usr/local/var/www/adminer/`.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String
#######################################
adminer_install ()
{
    echo "" >&2
    echo -e "${ORG} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Installing the Adminer project...           |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    mkdir -p $main/adminer
    cp -R $source/adminer $main/adminer
    ln -s $main/adminer $dist/adminer
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully cloned the Adminer
  sub-module to /usr/local/var/www/adminer/ and created a symbolic link
  to $dist/adminer in the project folder..${NOC}\n"
}

#######################################
# Installs the Error Pages project by
# checking out the source code to
# `/usr/local/var/www/error-pages/`.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String
#######################################
errorpages_install ()
{
    echo "" >&2
    echo -e "${GRN} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Installing the Apache Error Pages project...|" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    mkdir -p $main/error-pages
    cp -R $source/httpd/error-pages/dist/apache $main/error-pages
    ln -s $main/error-pages $dist/error-pages
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully cloned the Apache
  Error Pages sub-module to $main/error-pages and created a
  symbolic link to $dist/error-pages in the project folder.${NOC}\n"
}

#######################################
# Installs the phpMyAdmin project by
# checking out the source code to
# `/usr/local/var/www/phpmyadmin/`.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String
#######################################
phpmyadmin_install ()
{
  echo "" >&2
    echo -e "${BRO} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Installing the phpMyAdmin project...        |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
  mkdir $source/phpmyadmin
  cd $source/archives/
  wget https://files.phpmyadmin.net/phpMyAdmin/4.8.1/phpMyAdmin-4.8.1-all-languages.tar.gz
  tar -zxvf phpMyAdmin-4.8.1-all-languages.tar.gz \
    -C ../../src/phpmyadmin \
    --strip-components=1
  cd ../../
  cp -R $source/phpmyadmin $main/phpmyadmin
  ln -s $main/phpmyadmin $dist/phpmyadmin
  printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully installed the phpMyAdmin
sub-module to $main/phpmyadmin and created a
symbolic link to $dist/phpmyadmin in the project folder.${NOC}\n"
}

#######################################
# Install all the sub-modules required
# for the project.
#######################################
adminer_install
errorpages_install
phpmyadmin_install

printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Installation complete. All the
  required sub-modules have been installed.${NOC}\n"
