#!/bin/sh

ionic_ver=${1:-2.1.17}
cordova_ver=${2:-4.3.1}

npm install -g ionic@${ionic_ver}
npm install -g cordova@${cordova_ver}
npm install -g gulp
