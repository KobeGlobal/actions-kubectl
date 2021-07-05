#!/bin/sh -l
echo ${KUBECTL_CONFIG_DEFAULT_SERVICE} | base64 -d > kubeconfig

export KUBECONFIG=kubeconfig
#sed -i 's#{replicas}#${ REPLICA }#' $1
#sed -i 's#{container_image}#${ IMAGE }#' $1
#sed -i 's#{secret_name}#${ SECRET_NAME }#' $1
result="$(kubectl $1)"

status=$?
echo ::set-output name=result::$result
echo "$result"
if [[ $status -eq 0 ]]; then exit 0; else exit 1; fi
