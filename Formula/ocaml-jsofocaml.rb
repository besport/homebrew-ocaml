require 'formula'

class OcamlJsofocaml < Formula
  homepage ''
  url 'https://github.com/besport/js_of_ocaml.git', :use => :git
  version '1.2'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'ocaml-lwt'
  depends_on 'ocaml-deriving'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath
    bin.mkpath

    system "make"
    system "make", ("BINDIR=" + bin), "install"
  end

  def test
  end
end
