# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Linux System Optimizer and Monitoring"
HOMEPAGE="https://github.com/oguzhaninan/Stacer"
SRC_URI="https://github.com/oguzhaninan/Stacer/archive/refs/tags/v${PV}.tar.gz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtcharts:5
	dev-qt/qtsvg:5
	dev-qt/qtconcurrent:5"
BDEPEND="${DEPEND}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/Stacer-${PV}"
