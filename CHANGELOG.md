# Change-Log for Project

Below is a detailed change-log, along with specific tasks completed, for each 
version released to date.

## version-0.2.2
### 13/05/2018

1. [#new](#new)
    - Added Apache `*.conf` files to `/httpd/conf/`.
    - Added Apache custom `.conf` files to `/httpd/extra/`. These files are 
    ignored and need to be created at installation time.
1. [#enhancement](#enhancement)
1. [#bugfix](#bugfix)

## version-0.2.1
### 13/05/2018

1. [#bugfix](#bugfix)
    - Made `hosts_file` executable.
    - Removed `adminer/` and `httpd/error-pages/` from `git` and added them to 
    the `.gitignore` file. 

## version-0.2.0
### 13/05/2018

1. [#new](#new)
    - Added `/brew/` folder with the Apache start-up script.
    - New `git` templates.
    - Added `httpd/` folder with Apache `.conf` files.
    - New `src/` folder with scripts now for:
        + `brew_install` - Homebrew installation script.
        + `thirdparty_install` - Uses git to clone the Adminer project and 
        the Apache Error Pages project as sub-modules.
        + `hosts_file` - Backs up and creates symlink with hosts file.
    - Added a new `upgrade_software` script which upgrades the core as well as 
    sub-modules linked to the project. Closes #11.
1. [#enhancement](#enhancement)
    - New `CHANGELOG.md` for inclusion now with the `git` set-up. Closes [#9].
1. [#bugfix](#bugfix)
    - Replaced old `/.github/` folder with the more current version from 
    @justinhartman/.github as they were wrong. Closes #12.
    - Changed the template for `CHANGELOG.md` as it didn't have the `${domain}`
     set to display the project name in the file.
    - Fixed the word-wrap on the License messages contained in each file to 
    ensure they don't go longer than 80 characters.
    - Fixed the wrapping of the output messages on running parts of the script.

## version-0.1.2
### 10/05/2018

1. [#new](#new)
    - Symbolic link to `/adminer/`. See issue #6 for more details on how it 
    will be integrated into the first release candidate.
    - Added new template files for issue #8:
        + ISSUE_TEMPLATE.md
        + CONTRIBUTING.md
        + PULL_REQUEST_TEMPLATE.md
1. [#enhancement](#enhancement)
    - Integrated changes from issue #8 to now create `.github/` directory with 
    templates when setting up a new domain.
    - Added `.github/` directory to this actual project using the new 
    templates created in the #enhancement above.
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
