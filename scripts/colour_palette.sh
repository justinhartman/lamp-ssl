#!/bin/bash
#
# Fully automated LAMP installation and configuration using Trusted localhost
# SSL Certificates
#
# Copyright: Copyright 2018-2020 Justin Hartman (https://hartman.me)
# Author   : Justin Hartman <justin@hartman.me> (https://hartman.me)
# License  : https://opensource.org/licenses/AGPL-3.0 AGPL-3.0
# Version  : 1.2.0
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
# Defines variables for the colour
# palette used throughout the scripts.
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   Void
#######################################
colour_palette() {
    # Some colours to mess around with
    BLK='\033[0;30m' # Black
    GRY='\033[1;30m' # Dark Gray
    RED='\033[0;31m' # Red
    ORG='\033[1;31m' # Light Red (Orange)
    GRN='\033[0;32m' # Green
    BRO='\033[0;33m' # Brown/Orange
    BLU='\033[0;34m' # Blue
    PUR='\033[0;35m' # Purple
    LPU='\033[1;35m' # Light Purple
    CYA='\033[0;36m' # Cyan
    LGY='\033[0;37m' # Light Gray
    WHT='\033[1;37m' # White
    NOC='\033[0m'    # No Color
    export BLK GRY RED ORG GRN BRO BLU PUR LPU CYA LGY WHT NOC
}

#######################################
# Run the method.
#######################################
colour_palette
