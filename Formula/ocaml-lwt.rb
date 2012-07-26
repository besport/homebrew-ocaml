require 'formula'

class OcamlLwt < Formula
  homepage ''
  url 'http://ocsigen.org/download/lwt-2.4.0.tar.gz'
  md5 'fefff147103123180c50f6ee862979d9'
  version "2.4.0"

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'ocaml-ev'
  depends_on 'ocaml-react'
  depends_on 'ocaml-ssl'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "ocaml", "setup.ml", "-configure", "--enable-react", "--enable-ssl", "--bindir", bin
    system "ocaml", "setup.ml", "-build"
    system "ocaml", "setup.ml", "-install"
  end

  def test
  end
end
