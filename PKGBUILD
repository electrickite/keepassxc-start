# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=keepassxc-start
pkgver=1.1.0
pkgrel=1
pkgdesc="Unlock KeePassXC with local account credentials"
arch=('any')
url="https://github.com/electrickite/${pkgname}"
license=('MIT')
backup=("etc/default/${pkgname}")
depends=('bash'
         'coreutils'
         'gnupg'
         'grep'
         'keepassxc'
         'libsecret'
         'polkit'
         'psmisc'
         'sed'
         'tpm2-tools>=5.0'
         'util-linux')

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
