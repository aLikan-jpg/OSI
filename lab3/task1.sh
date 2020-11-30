#!/bin/bash

timenow=$(date '+%d.%m.%y_%H:%M')

mkdir ~/test && { echo "catalog test was created successfully" > ~/report ; touch ~/test/$timenow ; }
ping -c1 www.net_nikogo.ru || echo "${curdate} URL is unable to ping" >> ~/report
