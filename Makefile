# Variables for author details
AUTHOR_NAME = Peptide Now
AUTHOR_EMAIL = peptidenow@gmail.com

# commit-all: Automatically commits all changes with a predefined message
commit-all:
	@git add . && git commit -m "updated data" --author="$(AUTHOR_NAME) <$(AUTHOR_EMAIL)>"

# commit: Opens an editor for the commit message
commit:
	@git add . && git commit --author="$(AUTHOR_NAME) <$(AUTHOR_EMAIL)>"
