#!/usr/bin/env bash

chosen_job="$1"

config_file="$HOME/.hf_jenkins_jobs"

if [[ ! -f  "$config_file" ]]; then

cat >"$config_file" <<CONFIG
**GENERATED CONFIG -- MODIFY WITH CARE**
BASE_URL=
USER=etiennevo
TOKEN=

-- Add jobs below this line --

ECS-GESTION-STOCK-AUTO
ECS-MAGASINS-AUTO
ECS-AFTERSALES-AUTO
ECS-CUSTOMERS-AUTO
ECS-SUPPORT-TRANSVERSE-AUTO
ECS-VENTES-AUTO
ECS-PROXIMA-AUTO
ECS-PERSONNALISATION-AUTO
ECS-MSPRINT-AUTO
MSA-AUTOMATIC
ECS-MSA-AUTO
LAMBDA-MSCBR-AUTO
CONFIG

fi

base_url=$(grep "BASE_URL=" "$config_file" | cut -f2 -d'=')
if [ -z "$base_url" ]; then
  echo "Missing BASE_URL variable in $config_file"
  exit 3
fi

user=$(grep "USER=" "$config_file" | cut -f2 -d'=')
if [ -z "$user" ]; then
  echo "Missing USER variable in $config_file"
  exit 3
fi

user_token=$(grep "TOKEN=" "$config_file" | cut -f2 -d'=')
if [ -z "$user_token" ]; then
  echo "Missing TOKEN variable in $config_file"
  exit 3
fi

auth_token=$(echo -n "$user:$user_token" | base64)

if [[ -z "$chosen_job" ]]; then
  if ! command -v fzf >/dev/null 2>&1; then
    echo "Error: fzf command is not found"
    exit 3
  fi
  chosen_job="$(sed -n '/-- Add jobs below this line --/,$p' "$config_file" | tail +3 | fzf)"
fi

if [ -z "$chosen_job" ]; then
  echo "No selection...Do nothing"
  exit
fi

jenkins_response=$(curl --location --request POST -Is "${base_url}/job/${chosen_job}/build?delay=0" --header "Authorization: Basic ${auth_token}" 2> /dev/null)

echo "$jenkins_response" | grep --silent "^HTTP.*200" || { echo "Unexpected error : Missing HTTP 200 response code. "; exit 3; }

echo "Got Jenkins response: HTTP 200 OK"
echo "${base_url}/job/${chosen_job}/"
