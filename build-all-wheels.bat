:: Required: git, Visual Studio 10.0 Express, Windows 7 SDK

:: Save original path so we can restore it
set BASEPATH=%PATH%
:: These depends on where you installed Anaconda.
:: Python2 or Python3 doesn't matter but you need both 32bit and 64bit versions.
set ANACONDA_BASE=C:\Users\jonas\Anaconda
set ANACONDA_BASE64=C:\Users\jonas\Anaconda-64

:: Set up your conda environments like this, do it for both 32bit and 64bit.
:: navigate to the Anaconda\Scripts / Anaconda-64\Scripts directory to avoid setting any Paths
:: conda create -n py3.4 python=3.4 numpy pip mingw
:: conda create -n py3.3 python=3.3 numpy pip mingw
:: conda create -n py2.7 python=2.7 numpy pip libpython

:: These depend on what you named your environments above
set ENV27=envs\py2.7
set ENV34=envs\py3.4
set ENV33=envs\py3.3

:: Python 2.7 32bit
set PATH=%ANACONDA_BASE%\%ENV27%;%ANACONDA_BASE%\%ENV27%\Scripts;%BASEPATH%
pip install wheel
pip wheel --no-deps git+https://github.com/CamDavidsonPilon/lifelines.git

:: Python 2.7 64bit
:: You need to modify numpy in this environment's directory!
:: Open %ANACONDA_BASE64%\%ENV27%\Lib\site-packages\numpy\distutils\fcompiler\gnu.py
:: Search for 'raise NotImplementedError("Only MS compiler supported with gfortran on win64")', around line 333
:: replace with: pass
set PATH=%ANACONDA_BASE64%\%ENV27%;%ANACONDA_BASE64%\%ENV27%\Scripts;%BASEPATH%
pip install wheel
pip wheel --no-deps git+https://github.com/CamDavidsonPilon/lifelines.git


:: Python3 requires Visual Studio 2010 compiler present (Express version is fine)
set PATH=%BASEPATH%
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
set CPATH=%PATH%

:: Use CPATH instead of BASEPATH going forward


:: Python3.4 32bit
set PATH=%ANACONDA_BASE%\%ENV34%;%ANACONDA_BASE%\%ENV34%\Scripts;%CPATH%
pip install wheel
pip wheel --no-deps git+https://github.com/CamDavidsonPilon/lifelines.git

:: Python3.3 32bit
set PATH=%ANACONDA_BASE%\%ENV33%;%ANACONDA_BASE%\%ENV33%\Scripts;%CPATH%
pip install wheel
pip wheel --no-deps git+https://github.com/CamDavidsonPilon/lifelines.git


:: Python3 64bit
:: Use the SDK to enable x64 compiler since it is not included in express version
call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /Release /x64
:: 64-bit cl.exe is here
set CPATH=C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\bin\x86_amd64;%CPATH%


:: Python3.4 64-bit
set PATH=%ANACONDA_BASE64%\%ENV34%;%ANACONDA_BASE64%\%ENV34%\Scripts;%CPATH%
pip install wheel
pip wheel --no-deps git+https://github.com/CamDavidsonPilon/lifelines.git


:: Python3.3 64-bit
set PATH=%ANACONDA_BASE64%\%ENV33%;%ANACONDA_BASE64%\%ENV33%\Scripts;%CPATH%
pip install wheel
pip wheel --no-deps git+https://github.com/CamDavidsonPilon/lifelines.git


:: Restore path
set PATH=%BASEPATH%
