#!/bin/bash
#
# Apache 2.4 Setup and Configuration
#
# Copyright: Copyright 2018-2020 Justin Hartman (https://justinhartman.co)
# Author   : Justin Hartman <code@justinhartman.co> (https://justinhartman.co)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.2.2
# Link     : https://github.com/justinhartman/lamp-ssl
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
file_backup() {
    printf "${GRY}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Backing up the original Apache config files..." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    mv "${httpd}"/httpd.conf "${httpd}"/httpd.conf.original
    mv "${httpd}"/extra/httpd-ssl.conf "${httpd}"/extra/httpd-ssl.conf.original
    mv "${httpd}"/extra/httpd-vhosts.conf "${httpd}"/extra/httpd-vhosts.conf.original
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully backed up the Apache 2 configuration files.${NOC}\\n"
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
copy_files() {
    printf "${GRY}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Copying new Apache config files over..." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    cp "${source}"/httpd/conf/httpd.conf "${httpd}"/
    cp "${source}"/httpd/conf/httpd-ssl.conf "${httpd}"/extra/
    cp "${source}"/httpd/conf/httpd-vhosts.conf "${httpd}"/extra/
    cp "${source}"/httpd/extra/httpd-custom-alias.conf "${httpd}"/extra/
    cp "${source}"/httpd/extra/httpd-custom-directory.conf "${httpd}"/extra/
    cp "${source}"/httpd/extra/httpd-custom-error-pages.conf "${httpd}"/extra/
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully copied the new Apache 2 configuration files.${NOC}\\n"
}

#######################################
# Create website folder, restart
# Apache and create symbolic links.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
final_configuration() {
    printf "${GRY}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Creating symbolic links for Apache, PHP and Websites folder..." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    mkdir -p "${websites}" # Create default web root
    ln -s "${websites}" "${dist}"/websites
    ln -s "${httpd}" "${dist}"/apache
    ln -s "${php}" "${dist}"/php
    brew services restart httpd # (Re)start Apache
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Created symbolic links for Apache (${httpd}), PHP (${php}) and the new Websites folder (${websites}). Access to these folders is in '${dist}'.${NOC}\\n"
}

#######################################
# Installs localhost website folder.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
#######################################
install_localhost() {
    printf "${GRY}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Installing the HTML5 Boilerplate Template for https://localhost..." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    cp -Rp "${source}"/websites/localhost "${dist}"/websites/
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully installed the localhost website accessed at https://localhost. You can edit these files at '${dist}/websites/localhost'.${NOC}\\n"
}

#######################################
# Run the methods.
#######################################
file_backup
copy_files
final_configuration
install_localhost
