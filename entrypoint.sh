#!/bin/sh -l

# The following lines are taken from : https://itch.io/docs/butler/installing.html
# -L follows redirects
# -O specifies output name
curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default
unzip -o butler.zip
# GNU unzip tends to not set the executable bit even though it's set in the .zip
chmod +x butler
# just a sanity check run (and also helpful in case you're sharing CI logs)
./butler -V

# Adding butler to the path
chmod +x ~/bin/butler
PATH=$PATH:~/opt/bin

# Logging into butler using the env variable BUTLER_API_KEY, use the wharf api key
butler login

echo "Upload artifact $BUILD_NAME:$VERSION_NUMBER  from $BUILD_PATH"
