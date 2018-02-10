#!/bin/bash

if [[ $(systemctl status wg-quick@wg0 | grep " active") ]]; then
    echo '   Connected to centaurus'
else
    echo '   Not connected'
fi
