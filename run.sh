#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH
speedtest-cli > speedtest-results.temp
date >> results.txt
grep -E 'Upload:|Download:' speedtest-results.temp >> results.txt
rm speedtest-results.temp

ping -c 10 google.com > pingtest-results.temp
grep -E 'packets|avg' pingtest-results.temp >> results.txt
echo >> results.txt
rm pingtest-results.temp

exit
