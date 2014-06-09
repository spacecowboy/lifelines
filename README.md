# Building on Windows

## Setting up your environment

You need to be running a 64-bit version of Windows 7 or 8. If you are
only interested in building 32-bit versions, then 32-bit versions of
Windows will suffice, but you need a 64-bit Windows to build 64-bit
binaries here.

### Install Anaconda

[Download page](http://continuum.io/downloads)

Download both the 32-bit and 64 bit versions. Python2 or Python3
versions do not matter as we will be using virtualenv, but you do need
both 32-bit and 64-bit versions! During the installation procedure, I
recommend you select the following:

* Install for current user only (this is the default)
* Install into: _Users\YOURNAME\Anaconda_ and _Users\YOURNAME\Anaconda-64_ respectively
* Do **NOT modify the PATH**, this will be done explicitly in the build script
* Do **NOT make it the default Python**, we need to be able to switch easily

### Create the environments

**Do this for both the 32-bit and 64-bit versions.**

Open a command line window and navigate to
_Users\YOURNAME\Anaconda\Scripts_ (and same for _Anaconda-64_ later)
(Protip: use the file browser to get to the directory then shift-click
somewhere and select 'open command line here').

Type the following commands:

    conda create -n py3.4 python=3.4 numpy pip mingw

    conda create -n py3.3 python=3.3 numpy pip mingw

    conda create -n py2.7 python=2.7 numpy pip mingw


### Install the Windows SDK

The free Visual C++ 2010 Express compiler does not include 64-bit
support. That is what we need the SDK to provide. Google for
"Microsoft Windows SDK for Windows 7 and .NET Framework 4" or
[try this link](http://www.microsoft.com/en-us/download/details.aspx?id=8279).
You need the Windows 7 SDK even if you are running Windows 8. And make
sure it is the version with _.NET Framework 4_, the one with _.NET
Framework 3_ is for Visual Studio 2008.

Note: if you have C++ 2010 Redistributables installed, you might have
to uninstall them first or this install might fail.

### Install Visual C++ 2010 Express

A compiler is required to be able to build Python3 wheels. The free
Visual C++ 2010 Express is adequate. Please note that it is **not
possible to use a newer version** than 2010. Python3.4 is built with
2010 and hence all extensions must be as well.

Google for it, [or try this link](http://www.visualstudio.com/downloads/download-visual-studio-vs#DownloadFamilies_4)

### Install Visual C++ 2008 Express

For building Python2.7, 2008 version is required. Google for
"Visual C++ 2008 Express" or [try this link](http://go.microsoft.com/?linkid=7729279)

### Install git

Last step is to install
git. [Download it here](http://git-scm.com/download/win]). In this
case you absolutely DO want it to modify your PATH.

## Build the wheels!

Modify _build-all-wheels.bat_ with your username:

```bat
:: These depends on where you installed Anaconda.
:: Python2 or Python3 doesn't matter but you need both 32bit and 64bit versions.
set ANACONDA_BASE=C:\Users\YOURNAME\Anaconda
set ANACONDA_BASE64=C:\Users\YOURNAME\Anaconda-64
```

And now just run it (double-click on it). A directory named
_wheelhouse_ will be created and the wheels will be placed
inside. Once complete you should have 6 wheel files similar to:

    lifelines-0.3.3.0-cp27-none-win32.whl
    lifelines-0.3.3.0-cp27-none-win_amd64.whl
    lifelines-0.3.3.0-cp33-none-win32.whl
    lifelines-0.3.3.0-cp33-none-win_amd64.whl
    lifelines-0.3.3.0-cp34-none-win32.whl
    lifelines-0.3.3.0-cp34-none-win_amd64.whl
