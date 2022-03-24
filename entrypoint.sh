#!/bin/sh -l

# Setup variables
TOKEN=$1
PLUGINDIR=$2
ZIPNAME=$3
UPLOAD=0;

echo "TOKEN - $TOKEN"
echo "PLUGINDIR- $PLUGINDIR"
echo "ZIPNAME- $ZIPNAME"
echo ::set-output name=time::$time

# Install
npm i plugin-machine -g
## Build and ZIP
plugin-machine plugin build --buildDir=output --pluginDir="$PLUGINDIR" --token="$TOKEN"
plugin-machine plugin zip --buildDir=output --pluginDir="$PLUGINDIR" --token="$TOKEN"

## Upload to API
echo "Uploading $ZIPNAME"
curl --location --request POST 'https://pluginmachine.app/api/v1/files/' \
--header 'Authorization: Bearer "$TOKEN"' \
--form 'file=@"$PLUGINDIR/$ZIPNAME"' \
--form 'name="$ZIPNAME"' \
--form 'private="false"'
