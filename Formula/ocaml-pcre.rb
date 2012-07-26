require 'formula'

class OcamlPcre < Formula
  homepage ''
  url 'https://bitbucket.org/mmottl/pcre-ocaml/downloads/pcre-ocaml-6.2.5.tar.gz'
  md5 'a6f8873bbf5d2d0897654cc35fa59a42'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'pcre'

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
