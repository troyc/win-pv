win-pv
=========================================================

win-pv is a project that provides Windows PV drivers for OpenXT. It consists of:

	-A Wix project to build an installer.
	-A script to fetch external binaries (The Xen Windows PV drivers and Wix toolset).
	-Git submodules for forked and OpenXT-specific drivers (xenvusb and xenusbdevice).
	-A helper script to build all forked/OpenXT-specific drivers and the installer.

Building the drivers
-------------------

See BUILD.md


Installing the drivers
------------------

Run Installer.msi on a Windows guest with test-signing enabled.
