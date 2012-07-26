require 'formula'

class OcamlSnappy < Formula
  homepage ''
  url 'http://forge.ocamlcore.org/frs/download.php/874/ocaml-snappy-0.0.1.tar.gz'
  md5 '1ec0a0deee71dc0fa5238d17ccf0ada8'

  # depends_on 'cmake' => :build

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "make"
    system "make install"
  end

  def test
  end
end
