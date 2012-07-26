require 'formula'

class OcamlCryptokit < Formula
  homepage ''
  url 'http://forge.ocamlcore.org/frs/download.php/891/cryptokit-1.6.tar.gz'
  md5 '341a4ca2db7fc7755b08d2e54a6874e1'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

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
