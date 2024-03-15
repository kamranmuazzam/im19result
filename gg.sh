#!/bin/bash

# Define the version variable
old_version="1.144.115"
version="1.144.115"
LC_CTYPE=C find . -maxdepth 3 -type f -exec perl -pi -e "s/$old_version/$version/g" {} +



git pull
git add --all
git commit -m "$version"
git push -u origin main
gh release create v$version --title "Version $version" --notes "releasing $version, kudos"
gh release edit v$version --draft=false


# git tag v1.144.115
# git push origin v1.144.115
