require 'formula'

class OcamlYojson < Formula
  homepage ''
  url 'http://mjambon.com/yojson-1.0.3.tar.bz2'
  md5 '1d75d1acd51355a9bb054902fe60205e'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'ocaml-cppo'
  depends_on 'ocaml-biniou'
  depends_on 'ocaml-easy-format'

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
