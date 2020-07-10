#!/bin/bash
#
# User input to specify the domain name to add.
#
# Copyright: Copyright 2018-2020 Justin Hartman (https://hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.2.2
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
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
# User input to set the domain to be
# used for installation.
# Globals:
#   None
# Arguments:
#   String Site URL.
# Returns:
#   String Echo string to add domain.
#######################################
enter_domain() {
    printf "${RED}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Add a new domain to your macOS LAMP configuration." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    echo "Enter the domain name to be added " >&2
    read -r -p "(NB: do not include http:// or https://): " domain
    export domain
}

#######################################
# Run the method.
#######################################
enter_domain
