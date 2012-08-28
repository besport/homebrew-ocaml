require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OcamlEliom < Formula
  homepage ''
  url 'https://github.com/besport/eliom.git', :using => :git
  version '2.0.2'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'ocaml-ocsigenserver'
  depends_on 'ocaml-jsofocaml'
  depends_on 'ocaml-calendar'
  depends_on 'ocaml-deriving'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "sh", "configure", "--bindir", bin, "--docdir", doc, "--without-ocamlduce"
    system "make"
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
  end
end
