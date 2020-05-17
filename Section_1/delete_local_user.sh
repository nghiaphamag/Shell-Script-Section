#!/bin/bash


# Delete a user account on Ubuntu

# Make sure the script is being executed with superuser privileges.
if [[ ${UID} -ne 0 ]]
then
  echo "Execute with root pls."
  exit 1
fi

# Input a username who want detele
read -p "Enter username who want detele: " USER_DELETE

# Excete delete 
deluser --remove-home ${USER_DELETE}

if [[ "${?}" -ne 0 ]]
then
  echo "Delete username failed."
  exit 1
fi



