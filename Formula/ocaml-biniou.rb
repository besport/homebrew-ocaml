require 'formula'

class OcamlBiniou < Formula
  homepage ''
  url 'http://mjambon.com/biniou-1.0.0.tar.bz2'
  md5 '21865516df772ae7fabfaef053db771b'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'ocaml-easy-format'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "make"
    system "make install"
  end

  def test
  end
end
