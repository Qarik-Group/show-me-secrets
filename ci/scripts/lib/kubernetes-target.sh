#!/bin/bash

CLOUD_PROVIDER=$(cat $K8S_CLUSTER/metadata | jq -r ".provider")
case ${CLOUD_PROVIDER:?require "provider" key in pool resource metadata} in
  google|gcp)
    gcloud auth activate-service-account --key-file <(echo "${GCP_SERVICEACCOUNT:?require GCP Service Account JSON}")

    PROJECT=$(cat $K8S_CLUSTER/metadata | jq -r ".project")
    CLUSTER_NAME=$(cat $K8S_CLUSTER/metadata | jq -r ".cluster_name")
    CLUSTER_ZONE=$(cat $K8S_CLUSTER/metadata | jq -r ".cluster_zone")
    # CLUSTER_REGION=$(cat $K8S_CLUSTER/metadata | jq -r ".cluster_region")

    gcloud container clusters get-credentials "$CLUSTER_NAME" --region "$CLUSTER_ZONE" --project "$PROJECT"
    ;;
  *)
    echo "ERROR: unknown cloud provider $CLOUD_PROVIDER"
    exit 1
  ;;
esac
