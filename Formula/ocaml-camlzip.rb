require 'formula'

class OcamlCamlzip < Formula
  homepage ''
  url 'http://forge.ocamlcore.org/frs/download.php/328/camlzip-1.04.tar.gz'
  md5 'b3930f4f2e2563b9a5e1b17aa455e635'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "make"
    system "make install"
  end

  def patches
    # Set-up the installation directory according to OCAMLFIND_DESTDIR
    DATA
  end

  def test
  end
end

__END__
diff --git a/Makefile b/Makefile
index f3ce064..d65a9f0 100644
--- a/Makefile
+++ b/Makefile
@@ -11,7 +11,7 @@ ZLIB_INCLUDE=/usr/local/include
 
 # Where to install the library.  By default: sub-directory 'zip' of
 # OCaml's standard library directory.
-INSTALLDIR=`$(OCAMLC) -where`/zip
+INSTALLDIR=$$OCAMLFIND_DESTDIR
 
 ### End of configuration section

