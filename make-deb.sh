#!/bin/bash
HASH=`git rev-parse --short HEAD`
if [ "z$BUILD_NUMBER" == "z" ];
then
    iteration="0.pre.${HASH}"
else
    iteration=$BUILD_NUMBER
fi

fpm -t deb -s dir --exclude '.git*' --exclude make-deb.sh --architecture all --name elasticsearch-head --version 0.0.1 --iteration ${iteration} --prefix /opt/elasticsearch/plugins/elasticsearch-head/_site . || exit 1

