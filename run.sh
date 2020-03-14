#!/bin/sh

if [ ! -f /config/settings.conf ]; then
    echo "No configuration file found proceeding with default values"
    python3 /configurator.py
else
    echo "Configuration file found starting configurator with provided settings"
    python3 /configurator.py /config/settings.conf
fi
