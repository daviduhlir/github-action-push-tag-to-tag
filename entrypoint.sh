#!/bin/sh -l

set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable

echo "Starts"

DESTINATION_GITHUB_USERNAME="$1"
DESTINATION_REPOSITORY_NAME="$2"
USER_EMAIL="$3"
NEW_TAG="$4"
EXISTING_TAG="$5"

CLONE_DIR=$(mktemp -d)

echo "Checkout git repository"
# Setup git
git config --global user.email "$USER_EMAIL"
git config --global user.name "$DESTINATION_GITHUB_USERNAME"
git clone "https://$API_TOKEN_GITHUB@github.com/$DESTINATION_GITHUB_USERNAME/$DESTINATION_REPOSITORY_NAME.git" "$CLONE_DIR"
ls -la "$CLONE_DIR"

cd "$CLONE_DIR"

# add tag
echo "Moving/Adding tag"

if [ -z "$EXISTING_TAG" ]
then
  git tag $NEW_TAG -f
else
  git tag $NEW_TAG $EXISTING_TAG -f
fi

echo "Pushing to git"
# --set-upstream: sets de branch when pushing to a branch that does not exist
git push origin --tags --force
