#!/bin/bash

# Define the version variable
version="0.133.0"

# Define the JSON content with the version variable
json_content='{
  "version": "'"$version"'",
  "notes": "See the assets to download and install this version.",
  "pub_date": "2024-03-14T19:48:17.503Z",
  "platforms": {
    "darwin-x86_64": {
      "signature": "dW50cnVzdGVkIGNvbW1lbnQ6IHNpZ25hdHVyZSBmcm9tIHRhdXJpIHNlY3JldCBrZXkKUlVTQVJXYnVYYUpwaDB4WUg2YWxPZjNiTTBuTzQxRlloMm5LWkdrY1B3eDRPbjJQYTNIdDlIanNVbE5pZnI0VUVpelcxcmpKSnpZVjBVTVM5QjNKa0JYT0MvQTc3ZG13ZXdjPQp0cnVzdGVkIGNvbW1lbnQ6IHRpbWVzdGFtcDoxNzEwNDY5Nzc4CWZpbGU6SU0gMTkgcmVzdWx0cy5hcHAudGFyLmd6CitGVHROdUJVUVRoOGhNWEVzVkQxNjlWY3pTb055YlFMTGxXYlRZUmx6MHVpc0VuL0NTNmlQcWd4RDk1WVFhK3hqWlpXQ05HUVgzVTc4UHg5K3RjRENRPT0K",
      "url": "https://github.com/kamranmuazzam/im19result/releases/download/v'"$version"'/IM.19.results_x64.app.tar.gz"
    },
    "linux-x86_64": {
      "signature": "dW50cnVzdGVkIGNvbW1lbnQ6IHNpZ25hdHVyZSBmcm9tIHRhdXJpIHNlY3JldCBrZXkKUlVTQVJXYnVYYUpwaHl5NnFaN0VFZjI1MkhoeFkwcnk2aVVEckRkeDdyTmEwcGxQd05xbWN1ckp6V2QrdUFjTUd5d1hCSlVnYkpic25zNEduMDJsUFZxTDRjaStpWnc4RHdBPQp0cnVzdGVkIGNvbW1lbnQ6IHRpbWVzdGFtcDoxNzEwNDY5ODQyCWZpbGU6aW0tMTktcmVzdWx0c18wLjEzMy4wX2FtZDY0LkFwcEltYWdlLnRhci5negpPeHpSMmVGZHVBY1hRUEtWNXRHTUFCd3pqU3VGYk1iM3RGcEpvM0ZadFpZQUFJKytZNlZ4VUpXeGlRcU5IZE9aUi9RYmlaMDNaZDFKd3RxMDhlT0hDQT09Cg==",
      "url": "https://github.com/kamranmuazzam/im19result/releases/download/v'"$version"'/im-19-results_'"$version"'_amd64.AppImage.tar.gz"
    },
    "windows-x86_64": {
      "signature": "dW50cnVzdGVkIGNvbW1lbnQ6IHNpZ25hdHVyZSBmcm9tIHRhdXJpIHNlY3JldCBrZXkKUlVTQVJXYnVYYUpwaDFwYWJMeTlpakFacDhPbG5uRVRyeXExaXV2WWVhY0hyWWhHaC9MdzhNSGh6RjVrZXJoQVRsNWsxbyt6TzNEb1J3dm1WSHVlb25TaWxxclFhYU0wMlFBPQp0cnVzdGVkIGNvbW1lbnQ6IHRpbWVzdGFtcDoxNzEwNDY5OTUwCWZpbGU6SU0gMTkgcmVzdWx0c18wLjEzMy4wX3g2NF9lbi1VUy5tc2kuemlwCkpRdWRDbVFxVnJrSk9rV051d0VjN3p2VnRmUnpUcVAxbnhHZDFUSWo0RDRzeC9Xelp3MDE2bldVR3BNcXRrV1BraENkL2pGWFM5c3BnRVhGbFVwbkJnPT0K",
      "url": "https://github.com/kamranmuazzam/im19result/releases/download/v'"$version"'/IM.19.results_'"$version"'_x64_en-US.msi.zip"
    }
  }
}'

# Write JSON content to a file
echo "$json_content" > latest.json

echo "JSON file created successfully."


git add --all
git commit -m "'"$version"'"
git push -u origin main

# git tag v0.133.0
# git push origin v0.133.0
