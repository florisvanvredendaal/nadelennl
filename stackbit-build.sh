#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dd2b70daac7e400194afa7e/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dd2b70daac7e400194afa7e
curl -s -X POST https://api.stackbit.com/project/5dd2b70daac7e400194afa7e/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dd2b70daac7e400194afa7e/webhook/build/publish > /dev/null
