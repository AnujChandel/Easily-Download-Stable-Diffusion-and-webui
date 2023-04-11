@echo off


REM Get the Python version



REM Set the URL of the Python 3.10.6 installer for Windows x86-64
set URL=https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe

REM Set the filename of the installer
set FILENAME=python-3.10.6-amd64.exe

REM Download the installer
echo Downloading Python 3.10.6 installer...
curl -L %URL% -o %FILENAME%

REM Install Python
echo Installing Python 3.10.6...
start /wait %FILENAME% 

set "PATH=%PATH%;C:\Users\HP\AppData\Local\Programs\Python\Python310\" /m
python --version
timeout 3
REM Clean up the installer file
echo Cleaning up...
del %FILENAME%

echo Installation complete.
exit 0
