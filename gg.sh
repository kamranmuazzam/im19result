#!/bin/bash

# Define the version variable
old_version="0.0.114"
version="0.0.114"
LC_CTYPE=C find . -maxdepth 3 -type f -exec perl -pi -e "s/$old_version/$version/g" {} +



git pull
git add --all
git commit -m "$version"
git push -u origin main
gh release create v$version --title "Version $version" --notes "releasing $version, kudos"
gh release edit v$version --draft=false


# git tag v0.0.114
# git push origin v0.0.114
