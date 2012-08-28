require 'formula'

class OcamlOcsigenserver < Formula
  homepage ''
  url 'https://github.com/besport/ocsigenserver.git', :using => :git
  version '2.0.2'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  depends_on 'ocaml-lwt'
  depends_on 'ocaml-cryptokit'
  depends_on 'ocaml-react'
  depends_on 'ocaml-ssl'
  depends_on 'ocaml-tyxml'
  depends_on 'ocaml-net'
  depends_on 'ocaml-sqlite3'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath
    (var + "lib/").mkpath
    (var + "run/").mkpath
    (var + "log/ocsigenserver/").mkpath

    system "sh", "configure", "--commandpipe", "#{var}/run/ocsigenserver_commandpipe", "--datadir", "#{var}/lib/ocsigenserver/", "--bindir", bin, "--mandir", man, "--docdir", doc, "--ocsigen-user", "fx", "--ocsigen-group", "admin", "--sysconfdir", "#{etc}/ocsigenserver/", "--staticpagesdir", "#{var}/ocsigenserver/www", "--logdir", "#{var}/log/ocsigenserver/", "--with-sqlite"
    system "make"
    system "make", ("BINDIR=" + bin), "install"
  end

  def test
  end
end
