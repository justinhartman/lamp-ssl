#!/bin/bash
#
# Adds the new domain name to `/etc/hosts`.
#
# Copyright: Copyright 2018-2020 Justin Hartman (https://justinhartman.co)
# Author   : Justin Hartman <code@justinhartman.co> (https://justinhartman.co)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.2.2
# Link     : https://github.com/justinhartman/lamp-ssl
# Since    : 0.4.0
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
# Adds the new domain to `/etc/hosts`.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
hosts_domain() {
    printf "${WHT}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Add new domain to hosts file..." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    echo "127.0.0.1       ${domain}" >> "${hosts}"
    cat < "${hosts}" | grep "${domain}"
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully added ${domain} to ${hosts} file.${NOC}\\n"
}

#######################################
# Run the method.
#######################################
hosts_domain
