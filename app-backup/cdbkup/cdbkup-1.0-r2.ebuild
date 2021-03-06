# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="performs full/incremental backups of local/remote filesystems onto CD-R(W)s"
HOMEPAGE="http://cdbkup.sourceforge.net/"
SRC_URI="mirror://sourceforge/cdbkup/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

DEPEND="net-misc/openssh
	virtual/cdrtools
	virtual/eject
"
RDEPEND="${DEPEND}
	!app-misc/cdcat
"

src_prepare() {
	default
	sed -i -e "s:doc/cdbkup:doc/${P}:" Makefile.in || die
	sed -i -e 's/make /$(MAKE) /' Makefile.in || die
}

src_configure() {
	econf --with-snardir=/etc/cdbkup --with-dumpgrp=users
}

src_install() {
	default
	dodoc COMPLIANCE
}
