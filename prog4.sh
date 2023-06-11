#!/bin/bash

# Read the filename from user input
read -p "Enter the filename containing the matrix: " filename

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File does not exist!"
    exit 1
fi

# Read the matrix from the file and transpose it
mapfile -t matrix < "$filename"
transposed=()
for ((i = 0; i < ${#matrix[@]}; i++)); do
    row=(${matrix[i]})
    for ((j = 0; j < ${#row[@]}; j++)); do
        transposed[$j]+="${row[j]} "
    done
done

# Print the transposed matrix
for row in "${transposed[@]}"; do
    echo "$row"
done
