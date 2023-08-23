#!/bin/bash

if [ -z "$1" ];then
    BLOCKS=1
else
    BLOCKS=$1
fi
ADDR=mrCDrCybB6J1vRfbwM5hemdJz73FwDBC8r

bitcoin-cli -datadir=$PWD/01/bitcoin generatetoaddress $BLOCKS $ADDR
