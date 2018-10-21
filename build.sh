#!/bin/bash

docker ps | grep proxytoken-eos-dev
if [ $? -ne 0 ]; then
    echo "Run eos dev env "
    docker run --name proxytoken-eos-dev -dit --rm -v  `(pwd)`:/proxytoken eoslaomao/eos-dev:1.2.3
fi

docker exec proxytoken-eos-dev eosiocpp -g /proxytoken/proxytoken.abi /proxytoken/proxytoken.cpp
docker exec proxytoken-eos-dev eosiocpp -o /proxytoken/proxytoken.wast /proxytoken/proxytoken.cpp 
##docker exec eos-dev cleos -u http://$HOST:8888 --wallet-url http://$HOST:8900 set contract proxytoken ../proxytoken -p proxytoken@active
docker cp ../proxytoken nodeosd:/
