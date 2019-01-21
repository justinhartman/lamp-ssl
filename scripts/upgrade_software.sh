#!/bin/bash
#
# Upgrades the thirdparty software linked to the project.
# 
# Copyright: Copyright (C) 2018 Justin Hartman (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.1.0
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
# This method will upgrade the core as
# well as third-party repositories to
# ensure that we are running off the
# latest code-base.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   Void
#######################################
upgrade_projects ()
{
    printf "${ORG}%s\\n" "$TOP"
    printf "* %-76s %s\\n" "Checking for upgrades to the core..." "*"
    printf "%s${NOC}\\n\\n" "$BOTTOM"
    git pull
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully updated the core project.${NOC}\\n"
    printf "${ORG}%s\\n" "$TOP"
    printf "* %-76s %s\\n" "Checking for upgrades to the Adminer, GitHub and Apache Error Pages projects..." "*"
    printf "%s${NOC}\\n\\n" "$BOTTOM"
    git submodule update --recursive --remote
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully updated all the git submodules.${NOC}\\n"
    printf "${ORG}%s\\n" "$TOP"
    printf "* %-76s %s\\n" "Copying new files to their correct folder locations..." "*"
    printf "%s${NOC}\\n\\n" "$BOTTOM"
    cp -R "${source}"/httpd/error-pages/dist/apache/* "${main}"/error-pages/
    cp -R "${source}"/adminer/* "${main}"/adminer/
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully copied across all the new files.${NOC}\\n"
}

#######################################
# Get users input in order to upgrade
# the core and sub-modules linked to 
# the project.
#######################################
printf "${RED}%s\\n" "$TOP"
printf "* %-76s %s\\n" "Do you want to upgrade this project and all the sub-modules linked to it (Y/n)?" "*"
printf "%s${NOC}\\n\\n" "$BOTTOM"
echo -n "" >&2
read -r answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    upgrade_projects
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully upgraded the core and all related sub-modules.${NOC}\\n"
else
    printf "${RED}%s\\n" "$TOP"
    printf "* %-76s %s\\n" "OK, we are not going to upgrade any of the software!" "*"
    printf "* %-76s %s\\n" "Please note, however, you should keep all software up to date." "*"
    printf "* %-76s %s\\n" "Using the most up to date files ensures you benefit from bug fixes and enhancements." "*"
    printf "* %-76s %s\\n" "You should reconsider and make sure to update frequently." "*"
    printf "%s${NOC}\\n\\n" "$BOTTOM"
fi
