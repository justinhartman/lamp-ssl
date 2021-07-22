# Fully Automated macOS LAMP Installation using Trusted localhost SSL certs

[![Travis CI Status][travis-img]][travis-url]
[![CodeCov Coverage][codecov-img]][codecov-url]
[![Coverage Status][cover-img]][cover-url]

The Aston Martin of perfect LAMP set-ups and configuration. Automating the
entire process and managing your localhost SSL using trusted, self-signed CA
certificates.

<!-- MarkdownTOC -->

- [Installation](#installation)
    - [1. Clone Repo](#1-clone-repo)
    - [2. Run Initial Homebrew Install](#2-run-initial-homebrew-install)
    - [3. Run Install Script](#3-run-install-script)
- [Usage](#usage)
- [Upgrades](#upgrades)
- [Testing](#testing)
    - [Coding Standards](#coding-standards)
    - [Bash Automated Testing System](#bash-automated-testing-system)
        - [Caveats](#caveats)
    - [Automated Testing](#automated-testing)
- [License](#license)
- [TODO](#todo)
- [Authors](#authors)
- [Contributions](#contributions)
- [Acknowledgments](#acknowledgments)

<!-- /MarkdownTOC -->

## Installation

Installation is pretty simple and we have made it as automated as possible.
Follow the steps below and you should be good to go.

### 1. Clone Repo

By executing the commands below you will install the software to
`/usr/local/webserver`. You can change this path to whatever you like but for
ease of use and for upgrading (below) we recommend sticking to this.

```terminal
$ sudo mkdir -p /usr/local/webserver
$ sudo chown $(whoami):admin /usr/local/webserver
$ cd /usr/local/webserver
$ git clone https://github.com/justinhartman/lamp-ssl.git .
```

### 2. Run Initial Homebrew Install

Running the `./brew` command below will install `Homebrew` along with these
core dependencies: `httpd`, `php`, `mysql` and `wget`. **If you already have
Homebrew installed** you can skip the installation of this by answering `N`
when the script prompts you to install Homebrew. If you do skip the Homebrew
installation, please be sure to run the rest of script or else this software
may end up not functioning correctly.

Open up a terminal and execute the following commands.

```terminal
$ cd /usr/local/webserver
$ ./brew
```

### 3. Run Install Script

Once Homebrew and its dependencies have been installed you are ready to install
the main software. Run the following commands and follow the prompts in order
to complete the installation of this software.

```terminal
$ cd /usr/local/webserver
$ sudo ./install
```

## Usage

Once you have installed the software (see above) you are then able to add
domains/projects via the command line. To add a new project/domain simply
execute the following command via the terminal and follow the prompts:

```terminal
$ cd /usr/local/webserver
$ sudo ./lamp-add
```

The `lamp-add` script will output everything you need to know about your
newly configured domain/project.

## Upgrades

There is an automated upgrade script that you can run which will keep all the
software, including this repo and any linked third-party repos, up to date.
Simply run the following command to upgrade the software:

```terminal
$ cd /usr/local/webserver
$ sudo ./lamp-upgrade
```

## Testing

Details of the testing available for this project are found below.

### Coding Standards

We use the [Google Shell Style Guide][google] as the standard for writing our
code. We use `shellcheck` to ensure our coding standards are adhered to.

To run `shellcheck` tests locally, execute the following command.

```bash
$ shellcheck -xa -e SC2154 tests/brew tests/install tests/lamp-add \
  tests/lamp-upgrade tests/scripts/*.sh
```

### Bash Automated Testing System

The project uses [Bash Automated Testing System][bats] for all automated shell
script testing.

To run the BATS tests locally, execute the following commands.

```shell
$ cd ./tests # Tests must be run in this directory.
$ bats -t bats
```

**NB:** It is important to note that bats installs the software in macOS's
`$TMPDIR` directory and then performs the tests from there. This is to avoid
running tests on a production environment. If you need to change this path, or
any other variables, please make changes to `./tests/bats/globals.bash` and
`./tests/bats/globals.bats` accordingly.

#### Caveats

- BATS does not install `brew`. There would be too many conflicts in trying to
  install brew in an isolated environment so the `brew.bats` test always
  returns true on the `brew_install()` test.
- The other tests in `brew.bats` will try and install existing versions of the
  software on a machine that already has the packages installed. This doesn't
  cause any conflicts and shouldn't pose a problem on a machine already
  running `brew` packages.
- The domain name for the `enter_domain.bats` test is already preconfigured to
  `www.test.localhost`. This part of the script process normally relies on
  user input but as we can't use this the domain has been defined upfront.
- The tests in `keychain_certificate.bats` and `setup_ssl.bats` will add
  `www.test.localhost` to your macOS keychain. I don't know how to run this
  test successfully without running it on the default keychain.

### Automated Testing

Remote testing is done using [Travis CI][travis-url]. We test on all macOS
software versions from 10.13 up to and including 10.15.

## License

```text
Copyright 2018-2021 Justin Hartman <me@justinhartman.co> (https://justinhartman.co)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.
```

## TODO

Please [click here][github] for a list of updated issues.

## Authors

- Justin Hartman - [@justinhartman][author-1]

Also see the list of [contributors][contribs] who have participated in this
project.

## Contributions

The following projects have been integrated into this one.

- [@justinhartman/.github][my-github]
- [@justinhartman/adminer-custom][adminer]
- [@justinhartman/Apache-Error-Pages][errors]

## Acknowledgments

Special thanks go out to the following who have helped in some way to make
this project a reality.

- [Google Shell Style Guide][google]
- [@thojansen/client-certificates][certs]
- [@pematon/adminer-custom][pem-adminer]
- [@daniellmb/.github][.github]

[email]: mailto:code@justinhartman.co?subject=Github+Contact
[agpl]: https://opensource.org/licenses/AGPL-3.0
[license]: LICENSE
[site]: https://justinhartman.co
[post]: https://justinhartman.co
[git]: https://github.com/justinhartman/lamp-ssl
[github]: https://github.com/justinhartman/lamp-ssl/issues
[adminer]: https://github.com/justinhartman/adminer-custom
[errors]: https://github.com/justinhartman/Apache-Error-Pages
[certs]: https://github.com/thojansen/client-certificates
[my-github]: https://github.com/justinhartman/.github
[.github]: https://github.com/daniellmb/.github
[pem-adminer]: https://github.com/pematon/adminer-custom
[google]: https://google.github.io/styleguide/shell.xml
[bats]: https://github.com/sstephenson/bats
[travis-img]: https://travis-ci.com/justinhartman/lamp-ssl.svg?branch=master
[travis-url]: https://travis-ci.com/justinhartman/lamp-ssl
[cover-img]: https://coveralls.io/repos/github/justinhartman/lamp-ssl/badge.svg?branch=master
[cover-url]: https://coveralls.io/github/justinhartman/lamp-ssl?branch=master
[contribs]: https://github.com/justinhartman/.github/graphs/master
[author-1]: https://github.com/justinhartman
[codecov-img]: https://codecov.io/gh/justinhartman/lamp-ssl/branch/master/graph/badge.svg?token=DYO68X89Q7
[codecov-url]: https://codecov.io/gh/justinhartman/lamp-ssl
[codecov-graph]: https://codecov.io/gh/justinhartman/lamp-ssl/commit/e0bc841781709adcc35231753ebd2d59c9a9bf02/graphs/sunburst.svg
