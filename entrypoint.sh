#!/bin/sh -l

echo "Token $1"
echo "Path $2"
echo ::set-output name=time::$time


npm i plugin-machine -g
#plugin-machine plugin build --buildDir=output --pluginDir="${{ github.workspace }}" --token="$env:PLUGIN_MACHINE_TOKEN"
#plugin-machine plugin zip --buildDir=output --pluginDir="${{ github.workspace }}" --token="$env:PLUGIN_MACHINE_TOKEN"
