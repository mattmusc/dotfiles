#!/usr/bin/env python
# http://buffalo.nas-central.org/wiki/Auto_Mode_Power_Management
# Edited by: matteo.muscella@usi.ch

if __name__ == '__main__':

    import socket
    import time
    import sys

    if len( sys.argv ) < 2:
        print( "Usage: python wake.py [<LAN_BROADCAST_IP>] <TARGET_MAC_ADDRESS>" )
        sys.exit( 1 )

    bcast_addr = '192.168.2.255' # broadcast address for you network
    target_mac = sys.argv[1] # colons are optional, case does not matter

    if len( sys.argv ) > 2:

        bcast_addr = sys.argv[1] # broadcast address for you network
        target_mac = sys.argv[2] # colons are optional, case does not matter

    mac = target_mac.replace(':', "")
    mac_bytes = "".join([chr(int(mac[i:i+2], 16)) for i in range(0, len(mac), 2)])
    WoL_packet = '\xff'*6 + mac_bytes * 16

    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

    try:
        while 1:
            s.sendto(WoL_packet, (bcast_addr, 9))
            print "Sent paket!"
            time.sleep(180)

    except KeyboardInterrupt:
        print( '\nQuit' )
        sys.exit( 0 )

