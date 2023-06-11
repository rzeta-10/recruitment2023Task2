#!/bin/bash

# Read the desired length of the password from user input
read -p "Enter the length of the password: " length

# Generate a random password using OpenSSL
password=$(openssl rand -base64 "$((length * 2))" | tr -dc '[:alnum:]' | head -c "$length")

echo "Generated password: $password"
