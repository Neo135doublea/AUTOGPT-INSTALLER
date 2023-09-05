@echo off
setlocal enabledelayedexpansion

:: Check for a newer stable version using Python
python check_update.py
set RETURN_CODE=%ERRORLEVEL%

:: If a newer version is detected (RETURN_CODE is 1), proceed with the installation
if %RETURN_CODE% EQU 1 (
    echo Newer stable version detected! Proceeding with the installation...

    :: Prompt user for API key
    set /p API_KEY="Please enter your API key: "

    :: Clone the GitHub project
    git clone -b stable https://github.com/Significant-Gravitas/Auto-GPT.git

    :: Navigate to the cloned directory
    cd Auto-GPT

    :: Set up a virtual environment
    python -m venv venv

    :: Activate the virtual environment
    call venv\Scripts\activate

    :: Install requirements
    pip install -r requirements.txt

    :: Call Python script to modify .env file
    python modify_env.py "%API_KEY%"

    echo Update complete!
) else (
    echo No newer stable version detected.
)

pause
