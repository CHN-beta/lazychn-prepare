EAPI=8

inherit git-r3 flag-o-matic

DESCRIPTION="A quantum chemistry and solid state physics software package"
HOMEPAGE="https://www.cp2k.org"
EGIT_REPO_URI="https://github.com/cp2k/cp2k"
EGIT_TAG="v${PV}"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

RESTRICT="mirror"

DEPEND="sci-libs/fftw[threads]
	sci-libs/elpa
	>=sci-libs/libxc-5.0.0
	sci-libs/libxsmm
	sci-libs/spglib
	sci-libs/cosma"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gcc[fortran]
	dev-lang/python
	sci-libs/libint:2"

src_prepare() {
	cp ${FILESDIR}/basic.psmp arch
	default
}

src_compile() {
	# append-flags -Wno-missing-include-dirs
	emake ARCH=basic VERSION=psmp
}

src_install() {
	default
}
