require 'formula'

class Ocamlmod < Formula
  homepage ''
  url 'http://forge.ocamlcore.org/frs/download.php/856/ocamlmod-0.0.3.tar.gz'
  md5 'dec64b14a2dfb32bd25e3fc2f21e1c65'

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
