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
   net.addLink( h1, s1, bw = 10 )
   net.addLink( h2, s1, bw = 10 )

   info( '*** Starting network\n')
   net.start()

   info( '*** Set red options\n')
   s1.cmdPrint( 'tc qdisc add dev s1-eth1 root handle 1: red limit 1000000  max 30000 min 60000 burst 80 avpkt 1000 bandwidth 10Mbit adaptive ' )

   info('*** Traffic generation\n')
   h2.cmdPrint('iperf3 -s -D -1 ')
   time.sleep(21) # Wait 21 seconds
   h1.cmdPrint('iperf3 -c', h2.IP(),'-J > iperf_result.json')

   info( '*** Ping\n')
   h1.cmdPrint( 'ping -c 10', h2.IP(), '| grep "time=" | awk \'{print $5, $7}\' | sed -e \'s/time=//g\' -e\'s/icmp_seq=//g\' > ping.dat' )

   info( '*** Stopping network' )
   net.stop()

if __name__ == '__main__':
    setLogLevel( 'info' )
    emptyNet()