#!/bin/bash
echo -n "Enter your name: "
read username

dir_name="submission_reminder_${username}"
mkdir -p "$dir_name"/app "$dir_name"/modules "$dir_name"/assets "$dir_name"/config

echo "Directory has been created successfully"

mv config.env  "$dir_name"/config/
mv submissions.txt  "$dir_name"/assets/
mv functions.sh "$dir_name"/modules/
mv reminder.sh "$dir_name"/app/

touch "$dir_name"/startup.sh
chmod +x "$dir_name"/startup.sh

echo "Setup complete!"
