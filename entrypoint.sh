#!/bin/sh -l
{
    echo 'apiVersion: v1'
    echo 'kind: Config'
    echo 'clusters:'
    echo '- name: "ims"'
    echo '  cluster:'
    echo '      server: "https://rancher.getkobe.com/k8s/clusters/c-6qkj6"'
    echo 'users:'
    echo '- name: "ims"'
    echo '  user:'
    echo '      token: "kubeconfig-u-95mpm:mr4drptcm4fqbd8m6g769wnq2gfbmxgl4jv48nx6xhsqdjrqpwsh4l"'
    echo 'contexts:'
    echo '- name: "ims"'
    echo '  context:'
    echo '      user: "ims"'
    echo '      cluster: "ims"'
    echo 'current-context: "ims"'
} >> kubeconfig

export KUBECONFIG=kubeconfig
sed -i.bak 's#{replicas}#${ REPLICA }#' $1
sed -i.bak 's#{container_image}#${ IMAGE }#' $1
sed -i.bak 's#{secret_name}#${ SECRET_NAME }#' $1
result="$(kubectl $1)"

status=$?
echo ::set-output name=result::$result
echo "$result"
if [[ $status -eq 0 ]]; then exit 0; else exit 1; fi
