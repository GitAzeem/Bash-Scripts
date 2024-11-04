#!/bin/bash

#AUTHOR : AZEEM
# DATE: 10 SEPTEMBER 2024


# Check for superuser privileges
if [[ ! $(id -u) -eq 0 ]]; then
    echo "This script requires superuser privileges."
    exit 1
fi

# Prompt for user input
read -p "Enter the username: " username
read -p "Enter the full name: " full_name
read -s -p "Enter the initial password: " password

# Create the user
useradd -m -p "$password" "$username"

# Check if creation was successful
if [[ $? -eq 0 ]]; then
    echo "User $username created successfully."
    echo "Password: $password"
    echo "Host: $(hostname)"
else
    echo "Failed to create user. Please check for errors."
    exit 1
fi