require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OcamlLeveldb < Formula
  homepage ''
  url 'https://github.com/besport/ocaml-leveldb.git', :using => :git
  version '0.0.1'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build
  depends_on 'o-make'
  depends_on 'snappy'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "make", "fetch"
    system "make"
    system "make", "install"
  end

  def test
  end
end
