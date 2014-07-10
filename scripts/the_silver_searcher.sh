#!/usr/bin/env sh
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
git clone https://github.com/ggreer/the_silver_searcher.git
cd the_silver_searcher && ./build.sh && sudo make install && cd .. && rm -rf the_silver_searcher


