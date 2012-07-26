require 'formula'

class OcamlDeriving < Formula
  homepage 'https://github.com/jaked/deriving'
  url 'https://github.com/hnrgrgr/deriving.git', :using => :git
  version "0.1.1a"

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "make"
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
  end
end
