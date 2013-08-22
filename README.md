# w8f

[![Build Status](https://travis-ci.org/mirstack/w8f.png?branch=master)](https://travis-ci.org/mirstack/w8f)

**File creation detector.**

This is a simple tool that detects file existance or creation. The script can be used to
wait with performing some operations until non-existant yet file appears.

## Installation

To install `w8f` go to [releases][releases] page and pick latest package. Download
it and unpack with desired prefix:

    $ unzip -d /usr/local w8f-*.zip

[releases]: https://github.com/mirstack/w8f/releases

### Installing from source

To install package from sources you need to have few dependencies installed first. Install
**bash 4.0 or higher** and **inotifywait** tool in your system. When you're ready with
your dependencies run the following:

    $ ./configure --prefix=/usr/local
    $ make install

Run `install-man` instead of `install` if you want to have man pages installed as well.

## Usage

Given an example:

    $ w8f /tmp/hello

It will exit with status `0` when `/tmp/hello` appears. If the file already
exists, program will exit immediatelly with success.

## Hacking

If you wanna hack on `w8f` just clone the repo and play with the code.

### Testing

You can run tests with `test` target, no extra stuff is needed:

    $ make test

### Releasing

To build a new release use bundled make target called `pack`:

    $ make pack

It will wrap the binary and other needed files into a zip archive and save
it to `pkg/w8f-x.y.z-{os}-{arch}.zip`.

## Contribute

1. Fork the project.
2. Write awesome code (in a feature branch).
3. Test, test, test...!
4. Commit, push and send Pull Request.
