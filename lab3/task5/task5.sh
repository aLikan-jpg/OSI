#!/bin/bash

mkfifo pipe0

./task5_ps.sh & ./task5_gen.sh

rm pipe0
