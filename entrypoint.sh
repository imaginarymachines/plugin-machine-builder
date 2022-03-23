#!/bin/sh -l

TOKEN=$1
PLUGINDIR="/home/runner/work/plugin-machine-builder/builder-action-test-plugin"
echo "Token $TOKEN"
echo "PLUGINDIR $PLUGINDIR"
echo ::set-output name=time::$time


npm i plugin-machine -g
plugin-machine plugin build --buildDir=output --pluginDir="$PLUGINDIR" --token="$TOKEN"
plugin-machine plugin zip --buildDir=output --pluginDir="$PLUGINDIR" --token="$TOKEN"
