import csv
import sys
import os

MY_RECEIVER = '/dev/hidraw2'

def init_paths():
    """Make the app work in the source tree."""

    prefix = "/opt/solaar/"
    src_lib = os.path.join(prefix, 'lib')
    share_lib = os.path.join(prefix, 'share', 'solaar', 'lib')
    for location in src_lib, share_lib:
        init_py = os.path.join(location, 'solaar', '__init__.py')
        if os.path.exists(init_py):
            sys.path[0] = location
            break

if __name__ == '__main__':
    init_paths()

    from logitech_receiver import Receiver, hidpp20
    from logitech_receiver.base import receivers
    
    receiver = None
    for dev_info in receivers():
        if dev_info.path == MY_RECEIVER:
            receiver = Receiver.open(dev_info)
    if receiver is None:
        print("Receiver not connected")
        exit()

    for dev in receiver:
        dev.ping()

        if dev.online:
            battery = hidpp20.get_voltage(dev)
            voltage, charging, charge_sts, charge_lvl, charge_type = battery

            charge_filepath = os.path.join(os.path.dirname(__file__), 'g703_charge.csv')
            with open(charge_filepath) as file:
                charge_table = list(csv.DictReader(file))
            
            percent = 0
            for charge in charge_table:
                if float(charge['volt']) * 1000 <= float(voltage):
                    percent = charge['percent']

            print(f"G703: {percent}%")
        else:
            print("Mouse not connected")
