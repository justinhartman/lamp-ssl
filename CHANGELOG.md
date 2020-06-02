# Project Change-Log

Below is a detailed change-log, along with specific tasks completed, for each
version released to date.

## :rocket: Version 1.2.0 (03/06/2020)

- [:+1: #enhancement](#enhancement)
  - Renamed main scripts for better compatibility.
  - Updated Homebrew installer.
  - Upgraded Travis config.
  - Updated shellcheck test with latest OS.
  - Improved group variable with `id -gn`.
  - Updated bats tests.
  - Upgraded packages to current versions.
  - Standardised code in shell scripts.
  - Updated README with new instructions.
- [:new: #new](#new)
  - Added GitHub Sponsors.
- [:bug: #bugfix](#bugfix)
  - Fixed git submodule upgrade.
  - Fixed issue with TOP and BOTTOM in scripts.
  - Fixed issue with travis shellcheck error 127.
  - Fixed path to globals and colour_palette.
  - Changed permissions on files.
  - Removed Code and Sublime project files.

## Version 1.1.0 (21/01/2019)

- [#enhancement](#enhancement)
  - Install wget via brew and stop macOS Apache before trying to start Apache 2.
- [#new](#new)
  - New upgrade script for the project.
  - New installation instructions added (#14)
- [#bugfix](#bugfix)
  - Fixed the recursive loop in copying files over in `upgrade_software.sh`.

## Version 1.0.3 (21/01/2019)

- [#enhancement](#enhancement)
  - Changed output messages to use new `printf` format instead of `echo`.
  - Updated `globals.sh` file with `php 7.3` path as this has changed in brew from `7.2`.
  - Rename `add_domains` test script to `add_domain`.
  - Updated `.travis.yml` build file with correct paths.
  - Updated test scripts in `\tests\` folder with latest changes.

## Version 1.0.2 (18/11/2018)

- [#new](#new)
  - New `website_folder_ownership.sh` script to set permissions on the newly created domain folder.
  - New `bats` test for `website_folder_ownership.sh` script file.
- [#enhancement](#enhancement)
  - Renamed `folder_permissions.sh` to `folder_ownership.sh`.
  - Updated `bats` test for `folder_permissions`.
  - Renamed the `folder_permissions` in the `install` script.

## Version 1.0.1 (07/07/2018)

- [#new](#new)
  - New `docs` folder for the documentation.
- [#enhancement](#enhancement)
  - Renamed `add_domains` to `add_domain`.
  - `apache_config.sh` now creates symlink to PHP configuration folder.
  - Changed the message output for the following:
    + `setup_ssl.sh`
    + `apache_config.sh`
- [#bugfix](#bugfix)
  - Updated version numbers in script files.
  - Removed `coveralls` code coverage as it doesn't work with bash.

## Version 1.0.0 (03/07/2018)

This is the first production release since the first commit almost two months
ago. The following changes enable this major branch release.

- [#new](#new)
  - Included `./websites/localhost/` folder which contains a template for
    bootstrapping your development projects. This folder includes:
    - HTML5 Boilerplate version 6.1.0
    - Twitter Bootstrap version 3.3.7
    - jQuery version 1.11.2
    - Modernizr version 2.8.3
  - Symlink to `php` configuration folder to enable editing of `php.ini` file.
  - Added `restart_apache.sh` for inclusion in `add_domains` script.
- [#enhancement](#enhancement)
  - `apache_config.sh` script now installs the `localhost` website.
  - Changed output message to new format in `folder_permissions.sh`.
- [#bugfix](#bugfix)
  - Set file permissions correctly.
  - Added a delete method for `keychain_certificate.sh` that removes the old
    certificate before adding a new one when running `add_domains`.

## Version 0.6.2 (02/07/2018)

- [#new](#new)
  - File permission changes to files from machine migration.
- [#enhancement](#enhancement)
  - Changed the output messages.

## Version 0.6.1 (12/06/2018)

- [#new](#new)
  - In addition to `BATS` and Travis, `shellcheck` is also checking the source.
- [#enhancement](#enhancement)
  - Added `shellcheck` command to `.travis.yml` to run tests against the build.
  - Updated `folder_ownership()` method description in `folder_permissions.sh`.
- [#bugfix](#bugfix)
  - Applied all the bug fix recommendation from `shellcheck` to all scripts.
  - Fixed bug whereby the `.git` templates weren't being copied correctly.

## Version 0.6.0 (12/06/2018)

- [#new](#new)
  - Entirely new test suite using [BATS][bats]. Each method is now tested using
    individual `.bats` files contained in `./tests/bats/`. To run the entire
    test suite issue the following command:
    `$ bats tests/bats/`. This assumes you've [installed BATS][install-bats].
  - Added [Coveralls][coveralls] support but this is limited as they don't
    support `bash` yet. Go figure.
- [#enhancement](#enhancement)
  - Changed the success output from `printf` to `echo -e` as `printf` doesn't
    work with `bats` properly.
  - Removed `dist/websites` symlink as this gets generated at install time.
- [#bugfix](#bugfix)
  - Fixed up an array of bugs in individual scripts as debugged with `bats`.
    The list of changes is exhaustive so check the diff changes to the
    `scripts` folder for more detail.
  - Removed the `brew httpd` startup script as it's not needed.
  - Removed `scripts/brew_install.sh` as it has been replaced with the main
    `./brew` install script.
  - Removed the Travis test for `xcode6.4` in `.travis.yml` as this project
    doesn't build when running against `macOS 10.9/10.10`. It appears this
    is only supported on `macOS 10.11` and later.

## Version 0.5.2 (09/06/2018)

- [#bugfix](#bugfix)
  - Fixed output of echo message in:
    - `add_domains`
    - `apache_config.sh`
  - Fixed the extraction directory for phpMyAdmin in `thirdparty_install.sh`.
  - Fixed up the `git commit` not happening in correct folder.
- [#enhancement](#enhancement)
  - `brew_startup` added to `brew` script.
  - Added older versions of `macOS` for Travis to build against.


## Version 0.5.1 (09/06/2018)

- [#enhancement](#enhancement)
  - Included `thirdparty_install.sh` in `install`.
  - `thirdparty_install.sh` changes:
    - Removed the `git clone` commands for all as they are now submodules.
  - Improved `cp` command in `git_setup.sh`
- [#bugfix](#bugfix)
  - Fixed output of echo message in:
    - `install`
    - `apache_config.sh`
  - Set variables for hard coded paths in:
    - `thirdparty_install.sh`
    - `openssl_command.sh`
    - `hosts_file.sh`
  - Removed creation of `.gitignore` file as it overwrites the one from the
    .github templates.
  - Removed `''` preventing the output of the variable for `openssl.conf`.
  - Removed the moving of folders in `git_setup.sh` as it isn't needed.

## Version 0.5.0 (09/06/2018)

- [#new](#new)
  - New `.travis.yml` file. Testing CI to ensure it all builds as expected.
  - New `brew` primary script.
  - New test scripts contained in `./tests/` folder:
    - `install`: no changes to original.
    - `brew`: defaults to `no` so it will install Homebrew.
    - `add_domains`: manually set `domain="www.test.localhost"`.
  - Symbolic links in `./tests/` to `./src/`, `./dist/` and
    `./scripts/` folders.
- [#enhancement](#enhancement)
  - Removed generation of `pk12` key for Client Certificate in `setup_ssl.sh`.
- [#bugfix](#bugfix)
  - Fixed bug in `setup_ssl.sh` where it relies on `sudo`.
  - Moved `brew` install out of `install` script as it can't run in `sudo`

## Version 0.4.1 (30/05/2018)

- [#new](#new)
  - Added various Apache config files.

## Version 0.4.0 (29/05/2018)

- [#new](#new)
  - New `install` script to setup up the project initially.
  - Added the followin new scripts:
    - `colour_palette.sh`
    - `enter_domain.sh`
    - `folder_and_git.sh`
    - `folder_permissions.sh`
    - `git_setup.sh`
    - `globals.sh`
    - `hosts_domain.sh`
    - `keychain_certificate.sh`
    - `openssl_command.sh`
    - `openssl_config.sh`
  - New `phpmyadmin_install` installation method in the `thirdparty_install.sh`
    script.
  - New `src/archives/` folder to download `phpmyadmin`.
  - Added a new `folder_permissions` method to `add_domains` script.
  - New `addto_keychain` function in `setup_ssl.sh` script.
  - New `keychain_certificate` function in `add_domains` script.
  - New `paths.sh` script that sets global file paths.
- [#enhancement](#enhancement)
  - Updated `README.md`.
  - Changed install path of SSL certificates to `/usr/local/var/www/ssl`.
  - Updated `setup_localhost`:
    - To create SSL certs in `/usr/local/var/www/ssl`.
    - Created proper methods for the script.
    - Added messages echoed to the Terminal for each step.
  - Renamed and moved `setup_localhost` to `scripts/setup_ssl.sh`
  - Updated `httpd-vhosts.conf` to reflect changes to SSL certificates.
- [#bugfix](#bugfix)
  - Fixed up `CHANGELOG.md`.
  - Added `.sh` extensions to all scripts in the `/scripts/` folder to comply
    with code standards.
  - Added missing comments for methods contained in the
    `scripts/thirdparty_install.sh` script.

## version-0.3.0 (21/05/2018)

- Added new `apache_config` script.
- Fixed all scripts with new updated paths.
- Fixed README conflict.
- Restructured entire project. Now have `src` and `dist` folders for everything.
- `httpd.conf` changes.
- Merge pull request #13 from waffle-iron/master
- add waffle.io badge
- Added VS Code project workspace file.

## version-0.2.2 (13/05/2018)

- [#new](#new)
  - Added Apache `*.conf` files to `/httpd/conf/`.
  - Added Apache custom `.conf` files to `/httpd/extra/`. These files are
    ignored and need to be created at installation time.

## version-0.2.1 (13/05/2018)

- [#bugfix](#bugfix)
  - Made `hosts_file` executable.
  - Removed `adminer/` and `httpd/error-pages/` from `git` and added them to
    the `.gitignore` file.

## version-0.2.0 (13/05/2018)

- [#new](#new)
  - Added `/brew/` folder with the Apache start-up script.
  - New `git` templates.
  - Added `httpd/` folder with Apache `.conf` files.
  - New `src/` folder with scripts now for:
    - `brew_install` - Homebrew installation script.
    - `thirdparty_install` - Uses git to clone the Adminer project and
        the Apache Error Pages project as sub-modules.
    - `hosts_file` - Backs up and creates symlink with hosts file.
  - Added a new `upgrade_software` script which upgrades the core as well as
    sub-modules linked to the project. Closes #11.
- [#enhancement](#enhancement)
  - New `CHANGELOG.md` for inclusion now with the `git` set-up. Closes [#9].
- [#bugfix](#bugfix)
  - Replaced old `/.github/` folder with the more current ## version from
    `@justinhartman/.github` as they were wrong. Closes #12.
  - Changed the template for `CHANGELOG.md` as it didn't have the `${domain}`
    set to display the project name in the file.
  - Fixed the word-wrap on the License messages contained in each file to
    ensure they don't go longer than 80 characters.
  - Fixed the wrapping of the output messages on running parts of the script.

## version-0.1.2 (10/05/2018)

- [#new](#new)
  - Symbolic link to `/adminer/`. See issue #6 for more details on how it
    will be integrated into the first release candidate.
  - Added new template files for issue #8:
    - ISSUE_TEMPLATE.md
    - CONTRIBUTING.md
    - PULL_REQUEST_TEMPLATE.md
- [#enhancement](#enhancement)
  - Integrated changes from issue #8 to now create `.github/` directory with
    templates when setting up a new domain.
  - Added `.github/` directory to this actual project using the new
      templates created in the #enhancement above.
- [#bugfix](#bugfix)
  - Updated `add_domains` sudo output error message.

## version-0.1.1 (06/05/2018)

- [#enhancement](#enhancement)
  - [X] Need to comment the code properly; this remains undone - issue #3.
  - [X] Make code compliant ( issue #1 )

## version-0.1.0 (06/05/2018)

- [#new](#new)
  - Initial Release

[bats]: https://github.com/sstephenson/bats
[install-bats]: https://github.com/sstephenson/bats#installing-bats-from-source
[coveralls]: https://coveralls.io/github/justinhartman/Automated-LAMP-with-trusted-localhost-SSL
