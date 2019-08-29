#!/bin/sh
echo "Push to branch ${repo-token}";
[ -z "${repo-token}" ] && {
    echo 'Missing input "github_token: ${{ secrets.GITHUB_TOKEN }}".';
    exit 1;
};

header=$(echo -n "ad-m:${repo-token}" | base64)
git -c http.extraheader="AUTHORIZATION: basic $header" push origin refs/remotes/origin/master:master;