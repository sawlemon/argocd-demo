#!/bin/bash

COMMIT_HASH=$(git rev-parse HEAD) # lastest commited id

sed -i 's|<COMMIT_HASH>|"$COMMIT_HASH"|g' ./argocd/argocdapplication.yaml

if argocd app get helm-chart; then
  argocd app diff helm-chart --local argocdapplication.yaml
  CHANGES=$(argocd app diff helm-chart --local argocdapplication.yaml)
  if[[ -n $CHANGES ]];then
    argocd app sync helm-chart
  else
    echo "No detected"
  fi
else
  argocd app create --name helm-chart --file argocdapplication.yaml
