#!/bin/bash -x

for i in 01 02;do
    bitcoind -datadir=$PWD/$i/bitcoin/
done
sleep 1
for i in 01 02;do
    elementsd -datadir=$PWD/$i/elements/
done
sleep 1
for i in 01 02;do
    ~/liquid-functionary/target/debug/blocksigner $PWD/$i/blocksigner/ >$PWD/$i/blocksigner/debug.log 2>&1 &
    ~/liquid-functionary/target/debug/watchman $PWD/$i/watchman/ >$PWD/$i/watchman/debug.log 2>&1 &
done
./genblocks.sh 102 >/dev/null 2>&1
