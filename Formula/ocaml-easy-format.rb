require 'formula'

class OcamlEasyFormat < Formula
  homepage ''
  url 'http://mjambon.com/easy-format-1.0.0.tar.bz2'
  md5 '6f9d63d9e4e08b7b392598bdb99775bc'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

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
