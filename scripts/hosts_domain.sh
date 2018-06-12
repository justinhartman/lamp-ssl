#!/bin/bash
#
# Adds the new domain name to `/etc/hosts`.
# 
# Copyright: Copyright (C) 2018 Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 0.5.1
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
# Link     : https://justin.hartman.me
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
hosts_domain ()
{
    echo "" >&2
    echo -e "${WHT} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Add new domain to hosts file.               |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\\n" >&2
    echo "127.0.0.1       ${domain}" >> "${hosts}"
    cat < "${hosts}" | grep "${domain}"
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully added ${domain} to ${hosts} file.${NOC}\\n"
}

hosts_domain
