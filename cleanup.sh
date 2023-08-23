#!/bin/bash

for i in 01 02;do
    bitcoin-cli -datadir=$PWD/$i/bitcoin/ stop
    elements-cli -datadir=$PWD/$i/elements/ stop
done
sleep 1

killall elementsd
killall bitcoind
killall blocksigner
killall watchman

sleep 1

for i in 01 02;do
    rm -rf $PWD/$i/bitcoin/regtest
    rm -rf $PWD/$i/elements/elementsregtest
    rm -rf $PWD/$i/blocksigner/debug.log
    rm -rf $PWD/$i/watchman/debug.log $PWD/$i/watchman/blockchains.json $PWD/$i/watchman/local_watchman_hsm_state.json
done
