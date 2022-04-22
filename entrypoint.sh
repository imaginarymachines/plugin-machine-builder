#!/bin/sh -l

# Setup variables
TOKEN=$1
PLUGINDIR=$2

echo "TOKEN - $TOKEN"
echo "PLUGINDIR- $PLUGINDIR"

# Install
npm i plugin-machine -g

# Login
plugin-machine login --token="$TOKEN" --ci
# Build plugin with npm/composer as set in pluginMachine.json's build.prod key.
plugin-machine plugin build --buildDir=output --pluginDir="$PLUGINDIR"
# Create a zip with files/ paths set in pluginMachine.json's buildIncludes key
plugin-machine plugin zip --buildDir=output --pluginDir="$PLUGINDIR"
# Upload zip to Plugin Machine API
URL="plugin-machine upload --quiet"
echo $URL
echo "::set-output name=url::$URL"
## Upload to API
