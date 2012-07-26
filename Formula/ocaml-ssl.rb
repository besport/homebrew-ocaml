require 'formula'

class OcamlSsl < Formula
  homepage ''
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-ssl/0.4.6/ocaml-ssl-0.4.6.tar.gz'
  md5 '576c677bb70ea6552e4d49913c74d420'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "./configure"
    system "make"
    system "make install"
  end

  def test
  end
end
