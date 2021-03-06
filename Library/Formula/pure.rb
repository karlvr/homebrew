require 'formula'

class Pure < Formula
  homepage 'http://purelang.bitbucket.org/'
  url 'https://bitbucket.org/purelang/pure-lang/downloads/pure-0.58.tar.gz'
  sha1 '9ec99ed3a8166659153e25efcbfc14a227d9ad95'

  depends_on :automake
  depends_on :libtool

  depends_on 'llvm'
  depends_on 'gmp'
  depends_on 'readline'
  depends_on 'mpfr'

  resource 'docs' do
    url 'https://bitbucket.org/purelang/pure-lang/downloads/pure-docs-0.58.tar.gz'
    sha1 'f67a2e4723d7bbd92818e75f675e8057a02f3a00'
  end

  def install
    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--enable-release",
                          "--without-elisp"
    system "make"
    system "make install"
    resource('docs').stage { system "make", "prefix=#{prefix}", "install" }
  end

  test do
    system "#{bin}/pure", "--version"
  end
end
