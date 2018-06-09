# Project Change-Log

Below is a detailed change-log, along with specific tasks completed, for each
version released to date.

## Version 0.5.0 (30/05/2018)

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
