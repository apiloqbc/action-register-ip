#!/bin/sh
echo "Push to branch ${SSH_KEY}";
[ -z "${SSH_KEY}" ] && {
    echo 'Missing input "github_token: ${{ secrets.GITHUB_TOKEN }}".';
    exit 1;
};

header=$(echo -n "ad-m:${SSH_KEY}" | base64)
git -c http.extraheader="AUTHORIZATION: basic $header" push origin refs/remotes/origin/master:master;