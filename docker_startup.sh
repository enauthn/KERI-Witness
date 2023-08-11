#!/bin/bash
# docker_startup.sh

set -euo pipefail

ip=${IP_ADDRESS:-127.0.0.1}
http_port=${HTTP_PORT:-5631} # Default to 5631 if not provided
tcp_port=${TCP_PORT:-5632}   # Default to 5632 if not provided

sed -i "s/127.0.0.1/$ip/g" /keripy/keri/cf/witness-config.json
sed -i "s/5631/$http_port/g" /keripy/keri/cf/witness-config.json
sed -i "s/5632/$tcp_port/g" /keripy/keri/cf/witness-config.json

salt=${SALT:?Error: SALT environment variable not set}

WITNESS_NAME=${WITNESS_NAME:-witness_0}

cd /keripy

kli init --nopasscode --salt "$salt" --name "$WITNESS_NAME" --config-dir . --config-file witness-config.json

kli incept --name "$WITNESS_NAME" --alias "$WITNESS_NAME" --config . --file witness-incept-config-sample.json

exec kli witness start --name "$WITNESS_NAME" --alias "$WITNESS_NAME" -T "$tcp_port" -H "$http_port"
