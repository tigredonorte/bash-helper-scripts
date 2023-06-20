# Bash Helper Scripts
This repository contains a collection of Bash scripts that automate various tasks, making it easier to manage your workflow.

## Included Scripts
**gitCherrypickCommits.sh**: This script automates a common Git task. It compares your commits on origin/main with those on origin/release. If any of your commits are present on origin/main but not on origin/release, the script will cherry-pick those commits onto origin/release. This script uses your current Git user email and your Unix system email to identify your commits.

**gitNewBranch.sh**: This script creates a new branch in your local Git repository based on origin/main. The name of the branch should be provided as an argument and should start with 'feat/' or 'fix/' followed by a Jira number (e.g., 'feat/ABC-456').

**gitAmendPush.sh**: This script adds all changes to the Git staging area and amends the last commit. If a commit message is provided as an argument, it will be used for the new commit. If no commit message is provided, the last commit will be amended with no change to its message. The commit message will be prefixed with a JIRA task number extracted from the branch name, if present.

## Usage
Before running the scripts, make sure to make them executable with the following command:

bash
Copy code
chmod +x scriptname.sh
You can then run the scripts with:

bash
Copy code
./scriptname.sh

## Notes
Please note that if a script attempts to cherry-pick a commit that results in a merge conflict, the script will stop, and you'll need to resolve the conflict manually. After resolving the conflict, you can continue the cherry-pick with git cherry-pick --continue.

## Contribution
Feel free to fork this repository and submit pull requests for any improvements or additions you make.

