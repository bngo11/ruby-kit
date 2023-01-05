# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby27 ruby30 ruby31 ruby32"
RUBY_FAKEGEM_BINWRAP=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="HTTP server toolkit"
HOMEPAGE="https://github.com/ruby/webrick"
SRC_URI="https://github.com/ruby/webrick/tarball/650289c70d1bccb3e0cefcf6ede99dc043c5a9dd -> webrick-1.7.0-650289c.tar.gz"

post_src_unpack() {
	if [ ! -d "${S}/all/${P}" ] ; then
		mv "${WORKDIR}"/all/ruby-webrick-* "${S}"/all/"${P}" || die
	fi
}

KEYWORDS="*"
LICENSE="|| ( Ruby-BSD BSD-2 )"
SLOT="0"
IUSE="test"

all_ruby_prepare() {
	sed -i -e "s:_relative ': './:" ${RUBY_FAKEGEM_GEMSPEC} || die
}