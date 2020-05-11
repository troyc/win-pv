Building OpenXT Tools
=============================

Note that only xenbus, xenvusb, and xenusbdevice are built; the other drivers
use the binaries provided by the Xen Project.

First you'll need a device driver build environment for Windows 10. Happily
Microsoft has made this easy with the introduction of the 'EWDK'. This is an
ISO containing all the build environment you need (except for Wix, which is
included in the project).

The package should support building with the following EWDKs:

- EWDK for Windows 10, version 1903 with Visual Studio Build Tools 16.0
- EWDK for Windows 10, version 1809 with Visual Studio Build Tools 15.8.9

Once you have downloaded the ISO, open it and you should see a file called:

LaunchBuildEnv.cmd

Run this and it should give you a build environment command prompt. From
within this shell navigate to the root of your checked out repository
and run:

buildall.bat checked

Or, for a release build:

buildall.bat free



