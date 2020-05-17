#!/bin/bash

###########################################################
# Note:
#  date: print or set the system date and time
#  sha256sum: compute and check SHA256 message digest
#  head: output the first part of files
#  fold: wrap each input line to fit in specified width
#  shuf: generate random permutations
###########################################################

# A better generate password
PASSWORD=$(date +%s%N | sha256sum | head -c16) 
echo "${PASSWORD}"

# An even better password
PASSWORD=$(date +%s%N${RANDOM}${RANDOM}${RANDOM}| sha256sum | head -c32) 
echo "${PASSWORD}"

# Append a special character to the password
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"
