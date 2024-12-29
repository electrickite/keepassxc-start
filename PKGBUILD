# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=keepassxc-start
pkgver=1.0.1
pkgrel=1
pkgdesc="Unlock KeePassXC with local account credentials"
arch=('any')
url="https://github.com/electrickite/${pkgname}"
license=('MIT')
backup=("etc/default/${pkgname}")
depends=('keepassxc'
         'tpm2-tools>=5.0'
         'polkit'
         'libsecret'
         'bash'
         'coreutils'
         'util-linux'
         'grep'
         'sed'
         'gnupg')

source=("$pkgname"
        "Makefile"
        "${pkgname}.policy.in"
        "default")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
  make PREFIX=/usr
}

package() {
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
