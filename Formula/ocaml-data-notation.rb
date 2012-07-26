require 'formula'

class OcamlDataNotation < Formula
  homepage ''
  url 'http://forge.ocamlcore.org/frs/download.php/881/ocaml-data-notation-0.0.9.tar.gz'
  md5 'aa16e0f2230fa2bb2b3808c0665f056c'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build
  
  depends_on 'ocaml-typeconv'

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
