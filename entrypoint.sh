#!/bin/sh
set -e

if [ -n "$1" ] && [ "$1" != "node" ]; then
  NOME="$1"
  set -- node index.js
else
  NOME="visitante"
fi
export NOME

mkdir -p /logs
echo "$(date '+%Y-%m-%d %H:%M:%S') - Container iniciado - NOME=$NOME MODO=$MODO" >> /logs/app.log

exec "$@"
