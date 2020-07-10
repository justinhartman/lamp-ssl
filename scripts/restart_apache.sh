#!/bin/bash
#
# Restarts Apache.
#
# Copyright: Copyright 2018-2020 Justin Hartman (https://hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.2.2
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
# Since    : 1.0.0
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
# Restart Apache.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
restart_apache() {
    printf "${RED}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Restarting Apache 2..." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    brew services restart httpd
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully restarted Apache 2.${NOC}\\n"
}

#######################################
# Run the methods.
#######################################
restart_apache
