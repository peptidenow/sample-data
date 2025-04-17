#!/bin/bash

# Set the repository origin URL
REMOTE_URL="git@github.com:peptidenow/sample-data.git"

# Verify git filter-repo is installed
if ! command -v git-filter-repo &> /dev/null; then
    echo "git-filter-repo is not installed. Please install it first (e.g., pip install git-filter-repo)."
    exit 1
fi

# Run git filter-repo to rewrite the commit history
echo "Rewriting commit history to set author and committer to 'Peptide Now'..."
git filter-repo --commit-callback '
commit.author_name = b"Peptide Now"
commit.author_email = b"peptidenow@gmail.com"
commit.committer_name = b"Peptide Now"
commit.committer_email = b"peptidenow@gmail.com"
' --force

# Set the remote origin URL
echo "Setting remote origin to: $REMOTE_URL"
git remote add origin "$REMOTE_URL"

# Push the rewritten history to the main branch, forcefully
echo "Force-pushing rewritten history to the 'main' branch..."
git push origin main --force

echo "Done! The commit history has been rewritten and pushed."
