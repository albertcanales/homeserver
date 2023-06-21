#!/bin/bash

# Script that creates the secret files for the roles that required it
#
# For each role having a vars/secret_base.yml file and no vars/main/secret.yml,
# it will create the latter and copy the contents of the former

# Changes bash behaviour so when no expansion is met,
# a null string is returned insted of the original value
shopt -s nullglob

for vars in roles/*/vars; do
	if [ -f "$vars/secret_base.yml" ]; then
		if [ ! -f "$vars/main/secret.yml" ]; then
			mkdir -p "$vars/main/"
			cp "$vars/secret_base.yml" "$vars/main/secret.yml"
			echo "Created file $vars/main/secret.yml"
		else
			echo "File $vars/main/secret.yml already exists, ignoring"
		fi
	fi
done