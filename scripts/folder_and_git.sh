#!/bin/bash
#
# Creates a new directory in the webroot folder which is named after the domain
# name and creates a symlink. We also initialise a new git repo so that
# everything is under SCM.
# 
# Copyright: Copyright (C) 2018 Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.1.0
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
# Creates a new directory in the
# webroot folder which is named after
# the domain name and creates a symlink.
# We also initialise a new git repo so
# that everything is under SCM.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
folder_and_git ()
{
    printf "${BLU}%s\\n" "$TOP"
    printf "* %-76s %s\\n" "Add website folder and initialise git repo..." "*"
    printf "%s${NOC}\\n\\n" "$BOTTOM"
    mkdir -p "${websites}"/"${domain}"
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully created folder in ${websites}/${domain}.${NOC}\\n"
    git init "${websites}"/"${domain}"
    ls -lha "${websites}"/"${domain}"
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully created folder and initialised git repo for ${domain}.${NOC}\\n"
}

folder_and_git
