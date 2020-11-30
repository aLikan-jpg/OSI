#!/bin/bash

./task6_ps.sh & pid=$!
./task6_gen.sh $pid
