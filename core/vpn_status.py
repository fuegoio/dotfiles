#!/usr/bin/python3

import subprocess
import re

p = subprocess.Popen(["ps", "aux"], stdout=subprocess.PIPE)
out, err = p.communicate()

string_output = str(out)
processes = string_output.split('\\n')
openvpns = list(filter(lambda x: '/openvpn' in x, processes))

if len(openvpns) > 0:
    p = re.compile("(\S*)\.conf")
    match = p.search(openvpns[0])
    if match:
        vpn = match.group(1)
        print('   Connected to {}'.format(vpn))
    else:
        print('   Connected')
else:
    print('   Not connected')
