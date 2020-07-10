#!/bin/bash
#
# Creates and commits new repo files under SCM.
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
# Creates and commits new repo files.
# under SCM.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   String Success message.
#######################################
git_setup() {
    printf "${PUR}%s\\n" "${TOP}"
    printf '* %-76s %s\n' "git initial structure, files and check-in..." "*"
    printf "%s${NOC}\\n\\n" "${BOTTOM}"
    cp -R "${source}"/git/templates/_core/ "${websites}"/"${domain}"
    cp "${source}"/git/templates/_licenses/mit.txt "${websites}"/"${domain}"/LICENSE
    ls -lha "${websites}"/"${domain}"
    cd "${websites}"/"${domain}" || return
    git add -A
    git commit -m "Created git structure, .github template and initial project commit."
    echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully created files and committed changes.${NOC}\\n"
}

#######################################
# Run the method.
#######################################
git_setup
