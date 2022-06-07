#!/usr/bin/env sh

set -e

set -eo pipefail

export AWS_DEFAULT_REGION=us-east-1
export AWS_REGION=us-east-1

export AWS_ACCESS_KEY_ID="$1"
export AWS_SECRET_ACCESS_KEY="$2"
FILES="$3"

export TWINE_USERNAME=aws
export TWINE_PASSWORD=$(aws codeartifact get-authorization-token --domain flared --domain-owner 409905535292 --query authorizationToken --output text)
export TWINE_REPOSITORY_URL=$(aws codeartifact get-repository-endpoint --domain flared --domain-owner 409905535292 --repository pypi-private --format pypi --query repositoryEndpoint --output text)

twine upload "${FILES}"
