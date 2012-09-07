require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OcamlAws < Formula
  homepage ''
  url 'https://github.com/besport/aws.git', :using => :git
  version '0.0.1'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-oasis' => :build

  depends_on 'ocaml-lwt'
  depends_on 'ocaml-net'
  depends_on 'ocaml-cryptokit'
  depends_on 'ocaml-calendar'
  depends_on 'ocaml-xmlm'
  depends_on 'ocaml-cohttp'
  depends_on 'ocaml-yojson'

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
