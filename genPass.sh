#!/bin/bash

# Copyright (c) 2020, David Geovanny Chavez
# All rights reserved.

# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. 


# This is a random password generator.
# Created by davidc
# Version 1

# Variable to get first argument for length of password.
randomLine=$1

# Function to run the random generator.
function randomF(){
< /dev/urandom tr -dc a-zA-Z0-9 | head -c$randomLine; echo
}

# Conditions for negative numbers, letters, and numbers.
if [[ $# -eq 0 ]]; then
  randomLine=$( shuf -i 8-32 -n 1 )
  randomF
 elif [[ "$1" -eq "" ]] &>/dev/null; then
  randomLine=${#1}
  randomF
 elif [[ "$1" -lt 0 ]] &>/dev/null; then
  randomLine=$( echo $1 | cut --complement -c 1 )
  randomF
 elif [[ "$1" -gt 0 ]] &>/dev/null; then
  randomF
 else
  echo "ARGUMENT MUST BE NUMBERS OR LETTERS"
fi

