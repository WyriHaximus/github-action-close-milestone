#!/bin/bash

set -eo pipefail

if [ $(echo ${GITHUB_REPOSITORY} | wc -c) -eq 1 ] ; then
  echo -e "\033[31mRepository cannot be empty\033[0m"
  exit 1
fi

if [ $(echo ${INPUT_NUMBER} | wc -c) -eq 1 ] ; then
  echo -e "\033[31mMilestone number cannot be empty\033[0m"
  exit 1
fi

curl --request PATCH \
  --url https://api.github.com/repos/${GITHUB_REPOSITORY}/milestones/${INPUT_NUMBER} \
  --header "Authorization: Bearer ${GITHUB_TOKEN}" \
  --header 'Content-Type: application/json' \
  --data '{"state":"closed"}'
