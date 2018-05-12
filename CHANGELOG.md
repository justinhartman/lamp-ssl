# Change-Log for Project

Below is a detailed change-log, along with specific tasks completed, for each version released to date.

## version-0.1.3
### 12/05/2018

1. [#new](#new)
    - Added `/brew/` folder with the Apache start-up script.
    - New `git` templates.
    - Added `/httpd/` folder with Apache `.conf` files.
1. [#enhancement](#enhancement)
    - New CHANGELOG.md for inclusion now with the `git` setup. Closes #9.
1. [#bugfix](#bugfix)
    - Replaced old `/.github/` folder with the more current version from @justinhartman/.github as they were wrong. Closes #12.
    - 

## version-0.1.2
### 10/05/2018

1. [#new](#new)
    - Symbolic link to `/adminer/`. See issue #6 for more details on how it will be integrated into the first release candidate.
    - Added new template files for issue #8:
        + ISSUE_TEMPLATE.md
        + CONTRIBUTING.md
        + PULL_REQUEST_TEMPLATE.md
1. [#enhancement](#enhancement)
    - Integrated changes from issue #8 to now create `.github/` directory with 
    templates when setting up a new domain.
    - Added `.github/` directory to this actual project using the new templates created in the #enhancement above.
1. [#bugfix](#bugfix)
    - Updated `add_domains` sudo output error message.

## version-0.1.1
### 06/05/2018

1. [#enhancement](#enhancement)
    - [X] Need to comment the code properly; this remains undone - issue #3.
    - [X] Make code compliant ( issue #1 )

## version-0.1.0
### 06/05/2018

1. [#new](#new)
    - Initial Release
