require 'formula'

class OcamlNet < Formula
  homepage ''
  url 'http://download.camlcity.org/download/ocamlnet-3.5.1.tar.gz'
  md5 '9f4f474bfe88496220079e06791ff31c'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'ocaml-pcre'
  depends_on 'ocaml-cryptokit'
  depends_on 'ocaml-ssl'
  depends_on 'ocaml-camlzip'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "./configure"
    system "make all"
    system "make opt"
    system "make install"
  end

  def test
  end
end
