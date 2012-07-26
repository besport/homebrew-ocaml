require 'formula'

class OcamlXmlm < Formula
  homepage ''
  url 'http://erratique.ch/software/xmlm/releases/xmlm-1.1.0.tbz'
  md5 '443bb4e06ee5f88bbd2bafd5641f903d'

  # depends_on 'cmake' => :build

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "ocaml", "setup.ml", "-configure", "--bindir", bin
    system "ocaml", "setup.ml", "-build"
    system "ocaml", "setup.ml", "-install"
  end

  def test
  end
end
