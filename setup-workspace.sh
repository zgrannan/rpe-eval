#!/usr/bin/env bash

set -e

rm -rf workspace
mkdir workspace
git clone --depth 1 -b zgrannan/rpe https://github.com/zgrannan/prusti-dev.git workspace/prusti-dev
git clone --depth 1 https://github.com/viperproject/prusti-dev.git workspace/prusti-dev-orig
cp -r workspace/prusti-dev/local-testing workspace/prusti-dev-orig/local-testing
cp -r workspace/prusti-dev/test-rpe.sh workspace/prusti-dev-orig/test-rpe.sh
git clone --depth 1 https://github.com/zgrannan/symbolic-execution.git workspace/symbolic-execution
git clone --depth 1 https://github.com/zgrannan/pcs.git workspace/pcs
