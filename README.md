[![Build Status][travis-img]][travis-url]
[![Coverage Status][cover-img]][cover-url]

# Fully Automated macOS LAMP Installation using Trusted localhost SSL Certificates

The Aston Martin of perfect LAMP set-ups and configuration; automating the entire process and
managing your localhost SSL using trusted, self-signed CA certificates.

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
$ git clone https://github.com/justinhartman/Automated-LAMP-with-trusted-localhost-SSL.git .
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

## License

```text
Copyright 2018-2020 Justin Hartman <justin@hartman.me> (https://hartman.me)

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

Please [click here][github] for a list of updated TODO items.

## Contributions

The following projects have been integrated into this one.

- [@justinhartman/.github][my-github]
- [@justinhartman/adminer-custom][adminer]
- [@justinhartman/Apache-Error-Pages][errors]

## Acknowledgments

Special thanks go out to the following projects who have helped in some way to make this
project a reality.

- [Google Shell Style Guide][google]
- [@thojansen/client-certificates][certs]
- [@pematon/adminer-custom][pem-adminer]
- [@daniellmb/.github][.github]

[email]: mailto:justin@hartman.me?subject=Github+Contact
[agpl]: https://opensource.org/licenses/AGPL-3.0
[license]: LICENSE
[site]: https://justin.hartman.me
[post]: https://justin.hartman.me
[git]: https://github.com/justinhartman/lamp-ssl
[github]: https://github.com/justinhartman/lamp-ssl/issues
[adminer]: https://github.com/justinhartman/adminer-custom
[errors]: https://github.com/justinhartman/Apache-Error-Pages
[certs]: https://github.com/thojansen/client-certificates
[my-github]: https://github.com/justinhartman/.github
[.github]: https://github.com/daniellmb/.github
[pem-adminer]: https://github.com/pematon/adminer-custom
[google]: https://google.github.io/styleguide/shell.xml
[travis-img]: https://travis-ci.org/justinhartman/lamp-ssl.svg?branch=master
[travis-url]: https://travis-ci.org/justinhartman/lamp-ssl
[cover-img]: https://coveralls.io/repos/github/justinhartman/lamp-ssl/badge.svg?branch=master
[cover-url]: https://coveralls.io/github/justinhartman/lamp-ssl?branch=master
