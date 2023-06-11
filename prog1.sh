#!/bin/bash

# Read the current working directory from user input
read -p "Enter the current working directory: " cwd

# Check if the provided directory exists
if [ ! -d "$cwd" ]; then
    echo "Directory does not exist!"
    exit 1
fi

# Create the "Modified" directory if it doesn't exist
modified_dir="$cwd/Modified"
if [ ! -d "$modified_dir" ]; then
    mkdir "$modified_dir"
fi

# Recursively search for files with ".txt" extension
find "$cwd" -type f -name "*.txt" | while read -r file; do
    # Get the base filename without extension
    base_file="${file%.*}"
    
    # Create the new filename with ".bak" extension
    new_file="$modified_dir/$(basename "$base_file").bak"
    
    # Copy the file with the new filename
    cp "$file" "$new_file"
done

echo "Files with '.txt' extension have been copied to the 'Modified' directory with '.bak' extension."
