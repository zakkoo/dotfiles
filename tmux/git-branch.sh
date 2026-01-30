#!/bin/bash

# Get the current pane's path
current_path="$1"

# Change to the pane's directory
cd "$current_path" 2>/dev/null || exit 0

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    exit 0
fi

# Get the current branch name
branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)

# Output the result with a git icon
echo " ${branch}"
