#!/bin/bash
#docker build --no-cache . -t mynvim
docker build . -t mynvim
#docker run -it --rm mynvim -d
#docker run -d mynvim tail -f /dev/null