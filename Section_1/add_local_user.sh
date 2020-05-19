#!/bin/bash

#//////////////////////////////////////////////////////////////////////////////////////
# This script creates a new user on the local system
# You will be prompted to enter the username(login), the person name, and a password
# The username, password, host for the account will be display
#//////////////////////////////////////////////////////////////////////////////////////


# Make sure the script is being executed with superuser privileges.
if [[ ${UID} -ne 0 ]] 
then
  echo "Executed with superuser (root) pls."
  exit 1
fi

# Get the username (login).
read -p 'Input a user name is: ' USER_NAME

# Get the real name (contents for the description field).
read -p 'Input a real name here: ' COMMENT

# Get the password.
read -s -p 'Input your password: ' PASSWORD

# Create the user with the password.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd command succeeded.
if [[ "${?}" -eq 0 ]]
then	
  echo "Create username succeeded"
else
  echo "Create username failed"
  exit 1 
fi

# Set the password.
echo "${USER_NAME}:${PASSWORD}" | chpasswd

# Check to see if the passwd command succeeded.
if [[ "${?}" -eq 0 ]]
then	
  echo "Create password succeeded"
else
  echo "Create password failed"
  exit 1
fi 

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.
echo 
echo "User name is:"
echo ${USER_NAME}
echo 
echo "Password is:"
echo ${PASSWORD}
echo 
echo "Host:"
echo ${HOSTNAME}
