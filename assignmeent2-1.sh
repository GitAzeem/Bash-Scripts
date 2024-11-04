#!/bin/bash
# Author: Azeem
# Aim: To create users and groups, assign appropriate group memberships, and set correct home directory permissions for collaboration in a Linux environment.

# Creating users
sudo useradd neha
sudo useradd vipul
sudo useradd abhishek
sudo useradd nkhil
sudo useradd priyashi

# Creating groups
sudo groupadd linux
sudo groupadd sigma
sudo groupadd alpha

# Changing primary group for neha and abhishek to sigma
sudo usermod -g sigma neha
sudo usermod -g sigma abhishek

# Adding neha and abhishek to linux group as secondary group
sudo usermod -aG linux neha
sudo usermod -aG linux abhishek

# Adding nkhil and priyashi to both linux and alpha groups with a single command
sudo usermod -aG linux,alpha nkhil
sudo usermod -aG linux,alpha priyashi

# Changing permissions for users' home directories
for user in neha vipul abhishek nkhil priyashi; do
    # User should have read, write, execute access to their home directory
    sudo chmod 700 /home/$user

    # Other users in the same group should have read and execute access
    sudo chmod 750 /home/$user
done
