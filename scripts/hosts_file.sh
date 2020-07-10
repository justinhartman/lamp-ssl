#!/bin/bash
#
# Fully automated LAMP installation and configuration using Trusted localhost
# SSL Certificates
#
# Copyright: Copyright 2018-2020 Justin Hartman (https://hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.2.2
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
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
# Backs up the original `/etc/hosts`
# file to the `hosts/` directory.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
hosts_file_backup() {
    printf "${BRO}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Backup original hosts file ${hosts}..." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    cp "${hosts}" "${dist}"/hosts/hosts.original
    echo -e "${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully backed up hosts file.${NOC}\\n" >&2
}

#######################################
# Creates a symbolic link from
# `/etc/hosts` to `dist/hosts/hosts`.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
hosts_symbolic() {
    printf "${GRY}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Create symbolic link for ${hosts} to point to 'dist/hosts/hosts' file..." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    ln -s "${hosts}" "${dist}"/hosts/hosts
    ls -lh "${dist}"/hosts/hosts
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully created symbolic link from ${hosts} to ${dist}/hosts/hosts.${NOC}\\n" >&2
}

#######################################
# Run the methods.
#######################################
hosts_file_backup
hosts_symbolic
