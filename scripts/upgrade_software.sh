#!/bin/bash
#
# Upgrades the thirdparty software linked to the project.
# 
# Copyright: Copyright (C) 2018 Justin Hartman (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.0.2
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
    echo "" >&2
    echo -e "${ORG} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Checking for upgrades to the core...        |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\\n" >&2
    git pull
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully updated the core project.${NOC}\\n"
    echo "" >&2
    echo -e "${ORG} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Checking for upgrades to the Adminer,       |" >&2
    echo "|  GitHub and Apache Error Pages projects...   |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\\n" >&2
    git submodule update --init --recursive
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully updated all the git submodules.${NOC}\\n"
    echo "" >&2
    echo -e "${ORG} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  Copying any new files to their correct      |" >&2
    echo "|  folder locations...                         |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\\n" >&2
    cp -R "${source}"/httpd/error-pages/dist/apache "${main}"/error-pages
    cp -R "${source}"/adminer "${main}"/adminer
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully copied across all the new files.${NOC}\\n"
}

#######################################
# Get users input in order to upgrade
# the core and sub-modules linked to 
# the project.
#######################################
echo "" >&2
echo -e "${ORG} ----------------------------------------------" >&2
echo "|                                              |" >&2
echo "|  Do you want to upgrade this project and     |" >&2
echo "|  all the sub-modules linked to it (Y/n)?     |" >&2
echo "|                                              |" >&2
echo -e " ---------------------------------------------- ${NOC}\\n" >&2
echo -n "" >&2
read -r answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    upgrade_projects
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully upgraded the core and all related sub-modules.${NOC}\\n"
else
    echo -e "${ORG} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  OK, I'm not going to upgrade any of the     |" >&2
    echo "|  software. Please note, you should keep all  |" >&2
    echo "|  software up to date. Using the most up to   |" >&2
    echo "|  date files ensures you benefit from bug     |" >&2
    echo "|  fixes and enhancements. You should          |" >&2
    echo "|  reconsider and update frequently.           |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\\n" >&2
fi
