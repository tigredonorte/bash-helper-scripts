#!/bin/bash

# User input
branch_name=$1

# Validate input
if [[ ! $branch_name =~ ^(feat|fix)/[a-zA-Z]+-[0-9]+$ ]]
then
  echo "Invalid branch name. It should start with 'feat/' or 'fix/' followed by a Jira number (e.g., 'feat/ABC-456')."
  exit 1
fi

# Run git commands
git fetch origin main --prune
git checkout origin/main -b $branch_name
