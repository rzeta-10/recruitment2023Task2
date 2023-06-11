#!/bin/bash

# Read the current working directory from user input
read -p "Enter the current working directory: " cwd

# Check if the provided directory exists
if [ ! -d "$cwd" ]; then
    echo "Directory does not exist!"
    exit 1
fi

# Append current date and time to files in the "Modified" directory
modified_dir="$cwd/Modified"
if [ -d "$modified_dir" ]; then
    cd "$modified_dir" || exit 1
    
    for file in *.bak; do
        if [ -f "$file" ]; then
            # Append current date and time to the file
            mv "$file" "${file%.bak}_$(date +"%Y%m%d%H%M%S").bak"
        fi
    done
    
    echo "Date and time have been appended to the filenames."
else
    echo "The 'Modified' directory does not exist!"
    exit 1
fi
