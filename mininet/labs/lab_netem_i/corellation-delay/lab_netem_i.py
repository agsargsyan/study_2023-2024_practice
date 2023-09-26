#!/usr/bin/env python

"""
Simple experiment.
Output: ping.dat
"""

from mininet.net import Mininet
from mininet.node import Controller
from mininet.cli import CLI

from mininet.log import setLogLevel, info
import time

def emptyNet():

   "Create an empty network and add nodes to it."

   net = Mininet( controller=Controller, waitConnected=True )

   info( '*** Adding controller\n' )
   net.addController( 'c0' )

   info( '*** Adding hosts\n' )
   h1 = net.addHost( 'h1', ip='10.0.0.1' )
   h2 = net.addHost( 'h2', ip='10.0.0.2' )

   info( '*** Adding switch\n' )
   s1 = net.addSwitch( 's1' )

   info( '*** Creating links\n' )
   net.addLink( h1, s1 )
   net.addLink( h2, s1 )

   info( '*** Starting network\n')
   net.start()

   info( '*** Set delay\n')
   h1.cmdPrint( 'tc qdisc add dev h1-eth0 root netem delay 100ms 20ms distribution normal' )
   h2.cmdPrint( 'tc qdisc add dev h2-eth0 root netem delay 100ms' )

   time.sleep(10) # Wait 10 seconds

   info( '*** Ping\n')
   h1.cmdPrint( 'ping -c 100', h2.IP(), '| grep "time=" | awk \'{print $5, $7}\' | sed -e \'s/time=//g\' -e\'s/icmp_seq=//g\' > ping.dat' )

   info( '*** Stopping network' )
   net.stop()

if __name__ == '__main__':
    setLogLevel( 'info' )
    emptyNet()
