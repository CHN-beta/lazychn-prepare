# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )
inherit cmake desktop xdg python-single-r1

DESCRIPTION="Open Visualization Tool"
HOMEPAGE="https://www.ovito.org/"
SRC_URI="https://gitlab.com/stuko/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.bz2
    https://www.ovito.org/wp-content/uploads/logo_rgb-768x737.png -> ovito.png"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"
RESTRICT="mirror"
REQUIRED_USE="doc? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="sci-libs/fftw dev-lang/python sci-libs/netcdf media-video/ffmpeg dev-qt/qtcore:5"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/cmake dev-libs/boost x11-libs/qscintilla dev-qt/qtsvg dev-libs/libxslt dev-vcs/git
	doc? ( $(python_gen_cond_dep 'dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]' python3_{8..10} ) ${PYTHON_DEPS} )"

S="${WORKDIR}/${PN}-v${PV}"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DOpenGL_GL_PREFERENCE=GLVND
		-DOVITO_BUILD_DOCUMENTATION=$(usex doc ON OFF)
		-DPython3_EXECUTABLE=/usr/bin/python
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	
	insinto /usr/share/pixmaps
	insopts -m644
	doins "${DISTDIR}/ovito.png"

	domenu "${FILESDIR}/ovito.desktop"
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
