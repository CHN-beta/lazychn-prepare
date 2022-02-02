EAPI=8

inherit systemd

DESCRIPTION="Privacy-focused lightweight commenting engine"
HOMEPAGE="https://remark42.com/"
SRC_URI="https://github.com/umputun/remark42/releases/download/v${PV}/remark42.linux-amd64.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE=(MIT)
SLOT=0
KEYWORDS="~amd64"

RESTRICT="mirror"
QA_PREBUILT="*"

DEPEND="
	acct-group/remark42
	acct-user/remark42"
RDEPEND="
	${DEPEND}"
BDEPEND=""

S="${WORKDIR}"
src_install() {
	dobin remark42.linux-amd64

	systemd_dounit "${FILESDIR}/remark42.service"

	insinto /etc/remark42
	doins "${FILESDIR}/env"
	keepdir /etc/remark42
	fowners remark42:remark42 /etc/remark42
	fperms 0700 /etc/remark42

	keepdir /var/db/remark42
	fowners remark42:remark42 /var/db/remark42
	fperms 0700 /var/db/remark42
}
