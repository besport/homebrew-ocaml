require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OcamlQuadtree < Formula
  homepage ''
  url 'https://github.com/besport/ocaml-quadtree.git', :using => :git
  version '0.0.1'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-oasis' => :build

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "oasis", "setup"
    system "make"
    system "make install"
  end

  def test
  end
end
