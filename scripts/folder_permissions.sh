#!/bin/bash
#
# Modfies the folder permissions to the default user.
# 
# Copyright: Copyright (C) 2018 Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 0.5.0
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
# Sets the permissions recursively on
# the main folder to the current
# macOS user.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
folder_permissions ()
{
    echo "" >&2
    echo -e "${GRY} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Setting correct folder permissions to your  |" >&2
    echo "|  user account for the application folders.   |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    chown -R $username:$group $main
    chown -R $username:$group $httpd
    printf "\n${GRN}\xE2\x9C\x94${NOC} ${CYA}Successfully set folder permissions
  recursively on $main and $httpd.${NOC}\n"
}

# Output the method
folder_permissions
