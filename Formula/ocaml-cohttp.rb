require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OcamlCohttp < Formula
  homepage ''
  url 'https://github.com/besport/ocaml-cohttp.git', :using => :git
  version '0.1.3'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'ocaml-net'
  depends_on 'ocaml-pcre'
  depends_on 'ocaml-lwt'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "ocaml", "setup.ml", "-configure", "--bindir", bin
    system "ocaml", "setup.ml", "-build"
    system "ocaml", "setup.ml", "-install"
  end

  def test
  end
end
