@echo off
setlocal enabledelayedexpansion

:: Get the current directory where the script resides
set SCRIPT_DIR=%~dp0

:: Prompt user for API key
set /p API_KEY="Please enter your API key: "

:: Clone the GitHub project
git clone -b stable https://github.com/Significant-Gravitas/Auto-GPT.git "%SCRIPT_DIR%\Auto-GPT"

:: Navigate to the cloned directory
cd "%SCRIPT_DIR%\Auto-GPT"

:: Set up a virtual environment
python -m venv venv

:: Activate the virtual environment
call venv\Scripts\activate

:: Install requirements
pip install -r requirements.txt

:: Call Python script to modify .env file
python "%SCRIPT_DIR%\modify_env.py" "%API_KEY%"

:: Create a folder on the desktop
mkdir "%USERPROFILE%\Desktop\autogpt"

:: Create a shortcut to the workspace folder
echo Creating shortcut...
echo Set oWS = WScript.CreateObject("WScript.Shell") > createShortcut.vbs
echo sLinkFile = "%USERPROFILE%\Desktop\autogpt\auto_gpt_workspace.lnk" >> createShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> createShortcut.vbs
echo oLink.TargetPath = "%SCRIPT_DIR%\Auto-GPT\auto_gpt_workspace" >> createShortcut.vbs
echo oLink.Save >> createShortcut.vbs
cscript createShortcut.vbs
del createShortcut.vbs

:: Create a script to start the project
echo @echo off > "%USERPROFILE%\Desktop\autogpt\start_autogpt.bat"
echo cd "%SCRIPT_DIR%\Auto-GPT" >> "%USERPROFILE%\Desktop\autogpt\start_autogpt.bat"
echo call venv\Scripts\activate >> "%USERPROFILE%\Desktop\autogpt\start_autogpt.bat"
echo python -m autogpt >> "%USERPROFILE%\Desktop\autogpt\start_autogpt.bat"
echo pause >> "%USERPROFILE%\Desktop\autogpt\start_autogpt.bat"

echo Installation complete!
pause
