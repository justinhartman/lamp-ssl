#!/usr/bin/env bats

setup() {
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "colour palette" {
    colour_palette ()
    {
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
        NOC='\033[0m' # No Color
    }
    run colour_palette
    [ "$status" -eq 0 ]
}
