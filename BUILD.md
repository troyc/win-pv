Building OpenXT Tools
=============================

Note that only xenbus, xenvusb, xenusbdevice, and the installer are built; the other drivers
use the binaries provided by the Xen Project. The drivers can be built on any Windows 10
machine with a copy of the EWDK.

First, fetch the submodules (xenvusb, xenusbdevice, and the forked xenbus):

git submodule init
git submodule update

Then, run the powershell script to fetch the externals (the Xen PV drivers and Wix toolset)

powershell ./fetch-externals.ps1

Finally, it's time to build the drivers. Mount the EWDK iso and run LaunchBuildEnv.cmd to
launch the command prompt with a build environment. cd back to the win-pv directory and build
all the drivers and the installer using:

buildall.bat checked

Or, for a free build:

buildall.bat free

