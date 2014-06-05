#!/bin/bash
KCITURL=http://people.tuebingen.mpg.de/kzhang/KCI-test.zip
KCITZIPFILE=KCI-test.zip
BNTURL=https://bnt.googlecode.com/files/FullBNT-1.0.7.zip
BNTZIPFILE=FullBNT-1.0.7.zip

wget $KCITURL -O $KCITZIPFILE
unzip $KCITZIPFILE algorithms/* gpml-matlab/* CI_PERM/*
rm $KCITZIPFILE

wget --no-check-certificate $BNTURL -O $BNTZIPFILE
unzip $BNTZIPFILE bnt/*
rm $BNTZIPFILE
