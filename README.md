# KeePassXC Start

A small Bash script to unlock a KeePassXC database using polkit to prompt for the user's account credentials. The database master password is stored in an encrypted file. To decrypt the password a two-part key is used - one part is stored in the user's login keychain and the other is stored in an area that requires root access.

## Dependencies

keepassxc-start was developed on a GNU Linux system. Dependencies include:

  * KeePassXC
  * Bash
  * Polkit
  * libsecret (and a login keychain)
  * Make
  * Coreutils
  * Util Linux
  * Grep
  * sed
  * GPG
  * TPM2 Tools (optional, for TPM supprt)

## Install

Build and install with:

    $ make
    $ sudo make install

An Arch Linux PKGBUILD is included that will build a packge for Arch systems:

    $ makepkg -si

## Usage

    keepassxc-start [OPTION]... [COMMAND] [--] [ARG]...
    
    Any arguments after COMMAND or -- are passed to keepassxc.
    
    Commands:
      init                  Create decryption key and encrypt master password

    Options:
      -h, --help            Print this help text
      -v, --version         Print version information
      -q, --quiet           Silence informational output
      -k, --kill            Kill running instances of keepassxc before starting
      -s, --seal            Seal decryption prefix with TPM
      -H, --handle=HANDLE   TPM parent key handle
                            Default: 0x81110001
      -p, --pcr=PCR         List of PCR banks u
                            Default: sha256:0,7

## TPM

The decryption key prefix can optionally be sealed using the system TPM with the `--seal` option. A parent key is used in this process. If one is not already available, it can be created with:

    # tpm2_createprimary -c primary.ctx
    # tpm2_evictcontrol -c primary.ctx 0x81110001

If needed, the parent key handle can be set with `--handle` and the PCR banks to use can configured using `--pcr`.
