require 'formula'

class OcamlOasis < Formula
  homepage ''
  url 'http://forge.ocamlcore.org/frs/download.php/918/oasis-0.3.0.tar.gz'
  md5 'c2b6dec8c12517d85ce98e7feffe2531'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-pcre'

  depends_on 'ocamlify'
  depends_on 'ocamlmod'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "make build"
    system "make install"
  end

  def test
  end
end
