#!/bin/bash
cd /var/tmp
case $1 in
'-E')
svn checkout https://github.com/Ganesha2282882/lpkg.git/trunk/packages/$2 lpkg_pkg_src
cd lpkg_pkg_src
source PKGSCRIPT
cd ..
git clone $git_url lpkg_pkg_bld
cd lpkg_pkg_bld
build
;;
'-F')
svn checkout https://github.com/Ganesha2282882/lpkg.git/trunk/packages/$2 lpkg_pkg_fnd &&\
(echo Package is available. ; rm -rf lpkg_pkg_fnd) ||\
echo Package does not exist.
;;
'-P')
svn checkout https://github.com/Ganesha2282882/lpkg.git/trunk/packages/$2 lpkg_pkg_chk
less lpkg_pkg_chk/PKGSCRIPT
;;
'-D')
svn checkout https://github.com/Ganesha2282882/lpkg.git/trunk/packages/$2 lpkg_pkg_dnl
cd lpkg_pkg_dnl
source PKGSCRIPT
cd ..
git clone $git_url lpkg_pkg_dl2
mv lpkg_pkg_dl2 "/tmp/PKG_SOURCE"
echo "Source is available at /tmp/PKG_SOURCE."
;;
esac
rm -rf /tmp/lpkg_pkg_*
