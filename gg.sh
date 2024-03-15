#!/bin/bash

# Define the version variable
version="0.123.0"

# Define the JSON content with the version variable
json_content='{
  "version": "'"$version"'",
  "notes": "See the assets to download and install this version.",
  "pub_date": "2024-03-14T19:48:17.503Z",
  "platforms": {
    "darwin-x86_64": {
      "signature": "dW50cnVzdGVkIGNvbW1lbnQ6IHNpZ25hdHVyZSBmcm9tIHRhdXJpIHNlY3JldCBrZXkKUlVTQVJXYnVYYUpwaDdsUDR0K1hOVU1HdzByMGhMNGxwb25VSVI5ZGNWZ3NnNldFdlZpQm9CK093WDF2TGV6RkYxME1BVkozd1hiZWFuTkVHUjZPaU93cVlZZENDYVh6NXdjPQp0cnVzdGVkIGNvbW1lbnQ6IHRpbWVzdGFtcDoxNzEwNDQ1NTIxCWZpbGU6SU0gMTkgcmVzdWx0cy5hcHAudGFyLmd6CjlhYy9sWU1uNGp1Ym5rR2Nqc3ZPY1N2YTVTNWpWK2thYlNWbEhubnlyR2lrVHpSNGx3Qm9mMmU4SWtIM2tQVkdWcjdnWC9IcFBqVzFMd1AxSko5U0RBPT0K",
      "url": "https://github.com/kamranmuazzam/im19result/releases/download/v'"$version"'/IM.19.results_x64.app.tar.gz"
    },
    "linux-x86_64": {
      "signature": "dW50cnVzdGVkIGNvbW1lbnQ6IHNpZ25hdHVyZSBmcm9tIHRhdXJpIHNlY3JldCBrZXkKUlVTQVJXYnVYYUpwaDJzdG4wU3Z1NFpSZVJydzJrMlpLVzJ3SU1KOWpNRWZMcFphMzRDRzBKelFFUDFSNWRGaDVVRTdBS0pRWDJvZFh3Z2dkZlpFK1BjeXVncS9ZVjV3ZVFJPQp0cnVzdGVkIGNvbW1lbnQ6IHRpbWVzdGFtcDoxNzEwNDQ1NjIxCWZpbGU6aW0tMTktcmVzdWx0c18wLjEwLjBfYW1kNjQuQXBwSW1hZ2UudGFyLmd6CnVnTlZ4bmNwVk03YXo0Z1NzeDRFT2hJazgwazVneVBpb2d3Q3ZOcE5ORmt2WFBUeWFBU0JzWnQ3enh4ZzFZa2M4QTFKWFJJZUZCSFFZREUvZktJQ0JnPT0K",
      "url": "https://github.com/kamranmuazzam/im19result/releases/download/v'"$version"'/im-19-results_'"$version"'_amd64.AppImage.tar.gz"
    },
    "windows-x86_64": {
      "signature": "dW50cnVzdGVkIGNvbW1lbnQ6IHNpZ25hdHVyZSBmcm9tIHRhdXJpIHNlY3JldCBrZXkKUlVTQVJXYnVYYUpwaDRwRzRDczQ0NnVSczBjSWE3SHRFR21uRGkwalRDVEhpWmt1MXpxb1JwV2pBTlphTTl2TkMvUWhKTE1Odlg4OXBaYUFkMXlMamVkSldSV0M1ZGc0S2dNPQp0cnVzdGVkIGNvbW1lbnQ6IHRpbWVzdGFtcDoxNzEwNDQ1Njk0CWZpbGU6SU0gMTkgcmVzdWx0c18wLjEwLjBfeDY0X2VuLVVTLm1zaS56aXAKemhDR2FiRlRGK091bTJDRjVCV1duYk9IRmJPNURLVlI0VFBtVFUwOFVERnJSeExrc1Y4bEtSbGFQYlpXZXFWOWY5aWhGajhzY050ZmFyMyt2enRnQ3c9PQo=",
      "url": "https://github.com/kamranmuazzam/im19result/releases/download/v'"$version"'/IM.19.results_'"$version"'_x64_en-US.msi.zip"
    }
  }
}'

# Write JSON content to a file
echo "$json_content" > assets.json

echo "JSON file created successfully."


git add --all
git commit -m "'"$version"'"
git push -u origin main

# git tag v0.123.0
# git push origin v0.123.0
