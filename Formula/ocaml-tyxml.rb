require 'formula'

class OcamlTyxml < Formula
  homepage ''

  url 'https://github.com/besport/tyxml.git', :use => :git
  version '2.0.2'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'ocaml-net'

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
