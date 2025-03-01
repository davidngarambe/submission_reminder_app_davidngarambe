#!/bin/bash

#Requesting users to enter their names
read -p "Enter your Name: " name
# creating the directory based on the user's name 
mkdir -p submission_reminder_$name
# creating the  subdirectories 
mkdir submission_reminder_$name/app submission_reminder_$name/modules submission_reminder_$name/assets  submission_reminder_$name/config

touch  submission_reminder_$name/app/reminder.sh submission_reminder_$name/modules/functions.sh  submission_reminder_$name/assets/submissions.txt submission_reminder_$name/config/config.env submission_reminder_$name/startup.sh
# Entering data in the config.env file
cat << 'EOF' > submission_reminder_$name/config/config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
# "..." in the reminder.sh script file
cat << 'EOF' > submission_reminder_$name/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF
# funstions.sh script below
cat << 'EOF' > submission_reminder_$name/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF
#Populating the submissions.txt file
cat << 'EOF' > submission_reminder_$name/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
David, Shell Navigation, not submitted
John, Git, submitted
Joe, Shell Navigation, not submitted
Tray, Shell Basics, submitted
Tessy, Shell Navigation, not submitted
Xavier, Git, submitted
EOF
#Script for startup.sh
cat << 'EOF' > submission_reminder_$name/startup.sh
#!/bin/bash

./app/reminder.sh
echo "The is successfully running!"
EOF

chmod +x submission_reminder_$name/app/reminder.sh submission_reminder_$name/modules/functions.sh submission_reminder_$name/config/config.env submission_reminder_$name/startup.sh

echo "Your environment setup complete."
