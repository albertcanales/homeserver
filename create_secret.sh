#!/bin/bash

# Script that creates the secret files for the roles and groups that require it
#
# For each role having a vars/secret_base.yml file and no vars/main/secret.yml,
# it will create the latter and copy the contents of the former

# Changes bash behaviour so when no expansion is met,
# a null string is returned insted of the original value
shopt -s nullglob

# Create secret files for groups
for group in $(ls group_vars | sed -n "s/\(.*\)_secret_base.yml/\1/p"); do
	if [ -f "group_vars/${group}_secret_base.yml" ]; then
		if [ ! -f "group_vars/$group/secret.yml" ]; then
			mkdir -p "group_vars/$group"
			cp "group_vars/${group}_secret_base.yml" "group_vars/$group/secret.yml"
			echo "Created file group_vars/${group}_secret_base.yml"
		else
			echo "File group_vars/${group}_secret_base.yml already exists, ignoring"
		fi
	fi
done

# Create secret files for roles
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