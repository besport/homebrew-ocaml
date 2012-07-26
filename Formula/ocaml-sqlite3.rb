require 'formula'

class OcamlSqlite3 < Formula
  homepage ''
  url 'https://bitbucket.org/mmottl/sqlite3-ocaml/downloads/sqlite3-ocaml-1.6.3.tar.gz'
  md5 'bb27e99eed1c35989854272f7e83a232'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build
  #depends_on 'sqlite3' <-- Available in OSX, so no need for that

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath
    bin.mkpath

    system "./configure", "--bindir", bin
    system "make all"
    system "make opt"
    system "make doc"
    system "make install"
  end

  def patches
    DATA
  end

  def test
  end
end

__END__
diff --git a/Makefile.in b/Makefile.in
index 9f20e92..8af582d 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -47,7 +47,7 @@ distclean: clean
 install: sqlite3.cma sqlite3.cmxa sqlite3top
 	[ -f *.so ] && SO_FILES=*.so; \
 	ocamlfind install sqlite3 META sqlite3.cmi sqlite3.mli sqlite3.cma *.cmxa *.a *.cmx $$SO_FILES
-	ocamlfind ocamlmktop -o sqlite3top -package "sqlite3" sqlite3.cma
+	ocamlfind ocamlmktop -o sqlite3top -I "$$OCAMLFIND_DESTDIR" sqlite3.cma
 	$(INSTALL) sqlite3top $(bindir)/sqlite3top
 
 remove: uninstall
