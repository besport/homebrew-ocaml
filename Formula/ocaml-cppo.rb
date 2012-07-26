require 'formula'

class OcamlCppo < Formula
  homepage ''
  url 'http://mjambon.com/cppo-0.9.2.tar.bz2'
  md5 'f0872e3bb2c781881fd0437017107343'

  depends_on 'ocaml'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath
    bin.mkpath

    system "make"
    system "make", ("BINDIR=" + bin),  "install"
  end

  def test
  end
end
