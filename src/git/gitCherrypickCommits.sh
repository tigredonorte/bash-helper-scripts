#!/bin/bash

# Get current Git user email
GIT_EMAIL=$(git config --get user.email)

# Get Unix system email (assuming it's in the format username@hostname)
SYSTEM_EMAIL=$(whoami)@$(hostname)

# Fetch updates from the remote repository
git fetch origin

# Get a list of commit hashes from origin/main by you, using either of your email addresses
COMMITS_MAIN=$(git log --pretty="%H" --author="$GIT_EMAIL" --author="$SYSTEM_EMAIL" origin/main)

# Create an array to store commits that need to be cherry-picked
TO_CHERRY_PICK=()

# Check each of these commits against origin/release
for COMMIT in $COMMITS_MAIN
do
    # Check if the commit exists in origin/release
    if git branch origin/release --contains $COMMIT > /dev/null
    then
        # The commit is in origin/release, do nothing
        :
    else
        # The commit is not in origin/release, add it to the list to be cherry-picked
        TO_CHERRY_PICK+=($COMMIT)
    fi
done

# If there are commits to be cherry-picked, checkout origin/release and cherry-pick them
if [ ${#TO_CHERRY_PICK[@]} -ne 0 ]; then
    git checkout origin/release

    for COMMIT in "${TO_CHERRY_PICK[@]}"
    do
        git cherry-pick $COMMIT
    done
else
    echo "All your commits on origin/main are already on origin/release."
fi
