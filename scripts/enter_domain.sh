#!/bin/bash
#
# User input to specify the domain name to add.
# 
# Copyright: Copyright (C) 2018 Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://justin.hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 0.4.1
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
# User input to set the domain to be
# used for installation.
# Globals:
#   None
# Arguments:
#   String Site URL.
# Returns:
#   String Echo string to add domain.
#######################################
enter_domain ()
{
    echo -e "${RED} ----------------------------------------------" >&2
    echo "|                                              |" >&2
    echo "|  The Aston Martin of perfect LAMP setups     |" >&2
    echo "|  and configuration; automating the entire    |" >&2
    echo "|  process and managing your localhost SSL     |" >&2
    echo "|  using trusted self-signed CA certificates.  |" >&2
    echo "|                                              |" >&2
    echo -e " ---------------------------------------------- ${NOC}\n" >&2
    echo "Enter the domain name to be added " >&2
    read -p "(NB: do not include http:// or https://): " domain
}

enter_domain
