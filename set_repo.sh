#!/bin/sh
# Usage: ./set_repo.sh <github-user-or-org> <repo-name>
# Fills the placeholders in vex-repository.json and commits the change.
set -e
[ $# -eq 2 ] || { echo "usage: $0 <github-user-or-org> <repo-name>"; exit 1; }
sed -i.bak "s/REPLACE_ORG/$1/g; s/REPLACE_REPO/$2/g" vex-repository.json && rm -f vex-repository.json.bak
git add vex-repository.json && git commit -q -m "Set repository location to $1/$2" && echo "updated vex-repository.json for $1/$2"
