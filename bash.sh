#!/bin/bash
docker build . -t mynvim
#docker run -it --rm mynvim -d
docker run -d mynvim tail -f /dev/null