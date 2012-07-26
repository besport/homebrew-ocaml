require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OcamlImagemagick < Formula
  homepage ''
  url 'https://github.com/besport/ocaml-imagemagick.git', :using => :git
  version '0.33'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build
  depends_on 'imagemagick'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "make"
    system "make", "install"
  end

  def test
  end
end
