#!/bin/sh -l

echo $1 | base64 -d > kubeconfig
export KUBECONFIG=kubeconfig

result="$(kubectl $2)"

status=$?
echo ::set-output name=result::$result
echo "$result"
if [[ $status -eq 0 ]]; then exit 0; else exit 1; fi
