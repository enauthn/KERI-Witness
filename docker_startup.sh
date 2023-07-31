#!/bin/bash
# docker_startup.sh

set -euo pipefail

ip=${IP_ADDRESS:-127.0.0.1}
sed -i "s/127.0.0.1/$ip/g" /keripy/keri/cf/witness-config.json

salt=${SALT:?Error: SALT environment variable not set}

WITNESS_NAME=${WITNESS_NAME:-witness_0}

cd /keripy

kli init --nopasscode --salt "$salt" --name "$WITNESS_NAME" --config-dir . --config-file witness-config.json

kli incept --name "$WITNESS_NAME" --alias "$WITNESS_NAME" --config . --file witness-incept-config-sample.json

exec kli witness start --name "$WITNESS_NAME" --alias "$WITNESS_NAME" -T 5632 -H 5631
