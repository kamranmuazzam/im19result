#!/bin/bash

# Define the version variable
old_version="0.154.0"
version="0.155.0"
if [ -n "$old_version" ] && [ -n "$version" ]; then find . -type f -exec sed -i '' "s/$old_version/$version/g" {} +; fi



git add --all
git commit -m "$version"
git push -u origin main
gh release create v$version --title "Version $version" --notes "releasing $version, kudos"
gh release edit v$version --draft=false


# git tag v0.154.0
# git push origin v0.154.0
