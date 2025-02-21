#!/bin/bash
echo -n "Enter your name: "
read username

dir_name="submission_reminder_${username}"
mkdir -p "$dir_name"/app "$dir_name"/modules "$dir_name"/assets "$dir_name"/config

echo "Directory has been created successfully"

echo "Setup complete!"
