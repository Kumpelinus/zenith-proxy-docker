#!/bin/bash
set -e

# Check if the expected binary exists in the volume;
# if not, initialize the volume from the defaults.
if [ ! -f /app/ZenithProxy.jar ]; then
    echo "Initializing volume with default files..."
    cp -r /bin/* /app/
fi

# Execute the proxy (adjust this command as needed)
exec java -jar /app/ZenithProxy.jar

