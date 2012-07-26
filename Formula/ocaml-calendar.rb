require 'formula'

class OcamlCalendar < Formula
  homepage ''
  url 'http://forge.ocamlcore.org/frs/download.php/915/calendar-2.03.2.tar.gz'
  md5 '4f50e3c9ad0eec3d06c0457a2ba0f0b4'

  depends_on 'ocaml'
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.deparallelize
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib/"

    (lib + "ocaml/site-lib/").mkpath

    system "./configure"
    system "make"
    system "make install"
  end

  def test
  end
end
