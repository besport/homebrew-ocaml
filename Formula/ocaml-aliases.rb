require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OcamlAliases < Formula
  homepage ''
  url 'https://github.com/besport/ocaml-aliases.git', :using => :git
  version '0.0.2'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-oasis' => :build

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "oasis", "setup"
    system "ocaml", "setup.ml", "-configure"
    system "ocaml", "setup.ml", "-build"
    system "ocaml", "setup.ml", "-install"
  end

  def test
  end
end
