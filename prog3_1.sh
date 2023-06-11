#!/bin/bash

# Read the desired length of the password from user input
read -p "Enter the length of the password: " length

# Generate a random password using /dev/urandom
password=$(tr -dc '[:alnum:]' < /dev/urandom | fold -w "$length" | head -n 1)

echo "Generated password: $password"
