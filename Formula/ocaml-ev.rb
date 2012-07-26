require 'formula'

class OcamlEv < Formula
  homepage ''
  url 'http://www.modeemi.fi/~flux/software/ocaml-ev/ocaml-ev-0.4.tar.gz'
  md5 'fb45810ec671ba7e181dea6b6e0f789e'

  depends_on 'libev'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "make"
    system "make libinstall"
  end

  def test
  end
end
