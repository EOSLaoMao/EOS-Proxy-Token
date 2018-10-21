#!/bin/bash

ACCOUNT=${1:-masktransfer}
PKEY=$2

cleos set account permission $ACCOUNT active \
'{"threshold": 1,"keys": [{"key": "'$PKEY'","weight": 1}],"accounts": [{"permission":{"actor":"'$ACCOUNT'","permission":"eosio.code"},"weight":1}]}' owner
