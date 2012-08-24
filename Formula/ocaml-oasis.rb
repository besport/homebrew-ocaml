require 'formula'

class OcamlOasis < Formula
  homepage ''
  url 'http://forge.ocamlcore.org/frs/download.php/918/oasis-0.3.0.tar.gz'
  md5 'c2b6dec8c12517d85ce98e7feffe2531'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-pcre'

  depends_on 'ocamlify'
  depends_on 'ocamlmod'

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"
    ENV['OCAMLRUNPARAM'] = ""

    (lib + "ocaml/site-lib/").mkpath

    system "make build"
    system "make install"
  end

  def test
  end

  def patches
    DATA
  end
end

__END__
diff --git a/Makefile b/Makefile
index e386a51..5b9639e 100644
--- a/Makefile
+++ b/Makefile
@@ -27,7 +27,7 @@ CONFIGUREFLAGS += $(if $(shell ocamlfind query gettext),--enable-gettext,--disab
 default: test
        -OCamlDarcsPrecommit
 
-export OCAMLRUNPARAM=b
+# export OCAMLRUNPARAM=b
 TESTFLAGS      += -not-long
 #TESTFLAGS      += -verbose
 #TESTFLAGS      += -only-test OASIS:5:TestFull:2:../examples/packedlib:0:standard

