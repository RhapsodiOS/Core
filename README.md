# darwin-core

This is the top level of the FreeDarwin core source directory. This holds the base system command set, compilers, base config, kernel and boot loader.

For copyright information, please see the file COPYRIGHT in this directory (additional copyright information also exists for some sources in this tree - please see the specific source directories for more information).

## Build pre-requisites
FreeDarwin's build system builds new packages within a chroot'ed environment consisting entirely of previously built packages. For example, building a new version of Kernel installs all the components needed for building Kernel, into a chrooted environment, and then starts building Kernel in that chrooted environment.

Obviously, this leads to a paradox, since you'll need existing packages before you can build anything with this system. Luckily, there are prepared packages fr the entire FreeDarwin distribution. You do not need to install these packages as they are used by the build process in their packaged form.

What you do need installed for the process to work is dpkg and dpkg_scriptlibs along with perl5 and our buildtools package.
* Mount the package CD iso
* Manually extract the tar.gz from the deb package
* Extract the tar.gz contents over top the root filesystem

```
ar -p /CDROM/debs/dpkg_1.4.1.0.2-3_universal-apple-rhapsody.deb data.tar.gz | tar xzf- -C /
ar -p /CDROM/debs/dpkg-scriptlib_0.2-1_universal-apple-rhapsody.deb data.tar.gz | tar xzf- -C /
ar -p /CDROM/debs/buildtools_0.1-2_universal-apple-rhapsody.deb data.tar.gz | tar xzf- -C /

cd /tmp
ar x /CDROM/debs/dpkg_1.4.1.0.2-3_universal-apple-rhapsody.deb
cd /
tar -zxvf /tmp/data.tar.gz
cd /tmp
ar x /CDROM/debs/dpkg-scriptlib_0.2-1_universal-apple-rhapsody.deb
cd /
tar -zxvf /tmp/data.tar.gz
cd /tmp/
ar x /CDROM/debs/buildtools_0.1-2_universal-apple-rhapsody.deb
cd /
tar -zxvf /tmp/data.tar.gz
```

At some point, a QEMU system will be provided for self hostable builds, but the above will work for fine on a base install Rhapsody DR2 or Mac OS X Server 1.0 system.

## Building indivdiual packages
* Place the debs from the Release tarball in a directory e.g. /build/repo
* Place the source files in a directory e.g. /build/source/

```
usage: /usr/bin/darwin-buildpackage [ --cvs | --dir ] [ --target {all|headers|objs|local} ] <source> <deb package repository> <dstdir>
darwin-buildpackage --dir --target headers /build/source/kernel-7 /build/repo /build/built
```

## Building from the manifest file
* Current working directory must be directory containing source files e.g. /build/source

```
usage: /usr/bin/darwin-buildall <srclist> <deb package repository> <dstdir>
darwin-buildall Manifest /build/repo /build/built
```
