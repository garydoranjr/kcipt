#!/bin/bash
URL=http://people.tuebingen.mpg.de/kzhang/KCI-test.zip
ZIPFILE=KCI-test.zip

wget $URL -O $ZIPFILE
unzip $ZIPFILE algorithms/* gpml-matlab/* CI_PERM/*
rm $ZIPFILE
