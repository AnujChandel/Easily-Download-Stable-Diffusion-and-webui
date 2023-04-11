@echo off



echo Downloading Git %GIT_VERSION%...

curl -L https://github.com/git-for-windows/git/releases/download/v2.40.0.windows.1/Git-2.40.0-64-bit.exe -o Git-2.40.0-64-bit.exe
echo Installing Git...
rem first time
start /wait Git-2.40.0-64-bit.exe /NORESTART /silent /nomessagebox
rem second time
rem start /wait Git-2.40.0-64-bit.exe /NORESTAR

set "PATH=%PATH%;C:\Program Files\Git\cmd" /m

git --version
timeout 3


echo Cleaning up...
del Git-2.40.0-64-bit.exe



exit 0