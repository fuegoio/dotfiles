#!/bin/bash

if [[ $(ip addr show | grep "wg0") ]]; then
    echo '  '
else
    echo ''
fi
