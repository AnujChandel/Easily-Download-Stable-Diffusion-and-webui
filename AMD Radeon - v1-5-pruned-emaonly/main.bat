@echo off

echo,
echo ------------------------------------------------------------------
echo Please read the following 
echo ------------------------------------------------------------------
echo,
echo,

echo This Batch file is to download stable diffusion for AMD Radeon Graphic. 
echo,
echo Remember if you see "Running on local URL: http://127.0.0.1:7860" means it is completed. 
echo,
echo while downloading git do no changes and install. Untick the view Release notes
echo,
echo Git will install two times.
echo,
echo Copy and paste "http://127.0.0.1:7860" on web browser to run.
echo,
echo It is a personally Recommended to Edit COMMANDLINE_ARGS of webui-user.bat to "--autolaunch --precision full --no-half"
echo,
echo You have to click "Add Python 3.10 to path" and "Install now" while installing python.
echo,
echo Git will automatically install. If popup opens click "yes".
echo,

set /p drive=Enter the drive where you want to clone the repository (e.g. C, D, E):
echo,
set /p download_file=Do you want to download "Do you want to download v1-5-pruned-emaonly.ckpt(4.27GB) now? "? (y/n)

echo,



echo executing git_install.bat 
echo,

echo Downloading and installing Git 
echo,

 start /wait git_install.bat
echo,

echo executing python_install.bat
echo,

echo Downloading and installing python
echo,

start /wait python_install.bat
echo,

echo download git and python completed 


set "PATH=%PATH%;C:\Users\HP\AppData\Local\Programs\Python\Python310\" /m
set "PATH=%PATH%;C:\Program Files\Git\cmd" /m

git --version

python --version
timeout 10
echo Cloning repository...

cd /d %drive%:\

IF EXIST stable-diffusion-webui-directml (
    echo stable-diffusion-webui-directml Folder is already installed.
) 
iF NOT EXIST stable-diffusion-webui-directml (
git clone https://github.com/lshqqytiger/stable-diffusion-webui-directml && cd stable-diffusion-webui-directml && git submodule init && git submodule update
)

if /i "%download_file%"=="y" (
  echo Downloading file...  

 bitsadmin.exe /transfer "downloading v1-5-pruned-emaonly.ckpt" https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt %drive%:\stable-diffusion-webui-directml\models\Stable-diffusion\v1-5-pruned-emaonly.ckpt

)


cd /d %drive%:\stable-diffusion-webui-directml

echo starting webui-user.bat

start webui-user.bat

exit 

