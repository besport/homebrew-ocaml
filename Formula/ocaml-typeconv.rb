require 'formula'

class OcamlTypeconv < Formula
  homepage ''
  url 'http://forge.ocamlcore.org/frs/download.php/821/type_conv-3.0.5.tar.gz'
  md5 '8c0f947df6b4a063ce0c63a9bdd45df9'

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
end
