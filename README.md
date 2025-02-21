📌 Submission Reminder App
Overview
This project sets up the Submission Reminder App environment using a shell script. It will be used to remind students of when their assignments are due.
The script automatically creates the required directory structure and moves necessary files into their respective locations.

How to Run the Setup Script
  1. Clone the repository (if working from GitHub)
        git clone https://github.com/davidngarambe/submission_reminder_app.git
        cd submission_reminder_app

  2. Run the setup script:
        bash create_environment.sh
  3. Enter your name when prompted. This will create a directory named:
      submission_reminder_{yourname}
  4. Verify the setup:
     The following directories should be created:
     submission_reminder_{YourName}/
      ├── config/
      │   ├── config.env
      ├── modules/
      │   ├── functions.sh
      ├── assets/
      │   ├── submissions.txt
      |
      |-- app/
         |-- reminder.sh
Running the Application:
 Once the setup is complete, run the application using:
bash submission_reminder_{YourName}/scripts/startup.sh

Project structure:
📦 submission_reminder_app
 ┣ 📜 create_environment.sh  # The main script that sets up the environment
 ┣ 📜 README.md               # This file

 Notes:
 1. Ensure you have execute permissions for startup.sh by running:
    chmod +x submission_reminder_{YourName}/scripts/startup.sh
 2. Modify startup.sh to include the startup logic for the app.




