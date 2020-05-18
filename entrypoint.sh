#!/bin/sh -l
echo `apiVersion: v1
kind: Config
clusters:
- name: "ims"
  cluster:
    server: "https://rancher.getkobe.com/k8s/clusters/c-6qkj6"

users:
- name: "ims"
  user:
    token: "kubeconfig-u-95mpm:mr4drptcm4fqbd8m6g769wnq2gfbmxgl4jv48nx6xhsqdjrqpwsh4l"

contexts:
- name: "ims"
  context:
    user: "ims"
    cluster: "ims"

current-context: "ims"` | base64 -d > kubeconfig

export KUBECONFIG=kubeconfig

result="$(kubectl $1)"

status=$?
echo ::set-output name=result::$result
echo "$result"
if [[ $status -eq 0 ]]; then exit 0; else exit 1; fi
