require 'formula'

class Ocamlify < Formula
  homepage ''
  url 'http://forge.ocamlcore.org/frs/download.php/379/ocamlify-0.0.1.tar.gz'
  md5 'bcd97ad0f7203019019997197451dbf0'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

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
