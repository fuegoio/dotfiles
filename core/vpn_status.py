#!/usr/bin/python3

import os
vpns = [vpn for vpn in os.listdir('/run/openvpn-client')  if vpn[-3:] == 'pid']

if len(vpns) > 0:
    print('   Connected to {}'.format(vpns[0][:-4]))
else:
    print('   Not connected')
