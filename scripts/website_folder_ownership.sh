#!/bin/bash
#
# Modfies the folder permissions to the default user on the newly created
# website folder.
#
# Copyright: Copyright 2018-2020 Justin Hartman (https://hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.2.2
# Link     : https://github.com/22digital/Automated-LAMP-trusted-localhost-SSL
# Since    : 1.0.2
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
# Sets the ownership recursively on
# the main folder to the defined
# macOS user in 'globals.sh'.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
folder_ownership() {
    printf "${GRY}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "Setting correct folder permissions to your user account for" "*"
    printf '* %-76s %s\n' "the application folders." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    chown -R "${username}":"${group}" "${websites}/${domain}"
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully set folder permissions recursively on ${websites}/${domain}.${NOC}\\n"
}

#######################################
# Run the respective methods.
#######################################
folder_ownership
