#Installing and Updating the Auto-GPT Project
This guide will help you with the initial installation of the Auto-GPT project and its subsequent updates.

#Prerequisites:
Python: Ensure Python is installed. Download and install from the official website. During installation, check the box "Add Python X.X to PATH".

Git: Ensure Git is installed. Download and install from the official website. During installation, when prompted, select "Git from the command line and also from 3rd-party software".

Internet Connection: A stable internet connection is required to access GitHub.

#Steps:
Initial Installation:
Download the Installer Script: Ensure you have the installer.bat and modify_env.py scripts saved in a directory.

#Run the Installer:

Navigate to the directory containing the scripts.
Double-click on installer.bat.
When prompted, enter your API key.
The script will clone the project, set up a virtual environment, install required packages, and configure the .env file with your API key.
Verify Installation:

After the script completes, navigate to the Auto-GPT directory. You should see the project files, the virtual environment (venv), and the .env file with your API key.
Checking for Updates:
Download the Update Scripts: Ensure you have update_installer.bat, check_update.py, and modify_env.py saved in a directory.

#Run the Update Installer:

Navigate to the directory containing the scripts.
Double-click on update_installer.bat.
The script will check for a newer stable version on GitHub.
If detected, it will prompt you for your API key. Provide the key.
The script will then proceed with the installation process.
Verify the Update:

Once the script completes, navigate to the Auto-GPT directory. You should see the updated project files.
Notes:
Use installer.bat for the initial installation.
Use update_installer.bat to check for and install updates.
If issues arise, ensure Python and Git are correctly installed and added to your system's PATH.
For frequent updates, consider using a GitHub Personal Access Token to avoid rate limits. Modify the check_update.py script accordingly.
