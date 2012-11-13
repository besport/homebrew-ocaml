require 'formula'

class ObjectiveCaml < Formula
  homepage 'http://caml.inria.fr/ocaml/index.en.html'
  url 'http://caml.inria.fr/pub/distrib/ocaml-3.12/ocaml-3.12.1.tar.bz2'
  sha1 '29b44117b116b1a5bc54a8b4514af483793a769f'

  head 'http://caml.inria.fr/svn/ocaml/trunk', :using => :svn

  devel do
    url 'http://caml.inria.fr/pub/distrib/ocaml-4.00/ocaml-4.00.0.tar.gz'
    sha1 '9653e76dd14f0fbb750d7b438415890ab9fe2f4e'
    version '4.00.0'
  end

  bottle do
    sha1 'e5e28c74b859b8bb15a11f7f2a7a33608671b1b9' => :snowleopard
    sha1 'f32709be6cba5639a3f7185835963d630d6f8b59' => :lion
  end

  # Don't strip symbols, so dynamic linking doesn't break.
  skip_clean :all

  option 'without-x', 'Build without X11 support'

  depends_on :x11 unless build.include? 'without-x'

  def install
    configure_args = %W[
      --prefix #{HOMEBREW_PREFIX}
      --mandir #{man}
    ]
    unless build.include? 'without-x'
      configure_args << %W[
        --x11lib #{MacOS::X11.lib}
        --x11include #{MacOS::X11.include}
      ]
    end
    system "./configure", *configure_args
    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "make world"
    system "make world.opt"
    system "make opt"
    system "make opt.opt"
    system "make", "PREFIX=#{prefix}", "install"
    (lib+'ocaml/compiler-libs').install 'typing', 'parsing', 'utils'

    # site-lib in the Cellar will be a symlink to the HOMEBREW_PREFIX location,
    # which is mkpath'd by Keg#link when something installs into it
    ln_s HOMEBREW_PREFIX+"lib/ocaml/site-lib", lib+"ocaml/site-lib"
  end

  def patches
    # Adds dynlink.cmxa to the classic installation
    DATA
  end
end

__END__
diff --git a/configure b/configure
index 9be5199..35566a5 100755
--- a/configure
+++ b/configure
@@ -620,7 +620,7 @@ if test $withsharedlibs = "yes"; then
     *-*-cygwin*)                  natdynlink=true;;
     i[3456]86-*-linux*)           natdynlink=true;;
     x86_64-*-linux*)              natdynlink=true;;
-    i[3456]86-*-darwin10.*)
+    i[3456]86-*-darwin1[0123456789].*)
       if test $arch64 == true; then
         natdynlink=true
       fi;;
