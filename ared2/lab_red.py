
#!/usr/bin/env python

"""
Simple experiment.
Output: ping.dat
"""

from mininet.net import Mininet
from mininet.cli import CLI
from mininet.node import OVSKernelSwitch, Controller
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
   s2 = net.addSwitch( 's2' )

   info('*** Creating links\n')
   net.addLink( h1, s1, bw = 10 )
   net.addLink( s1, s2 )
   net.addLink( h2, s2, bw = 10 )

   info( '*** Starting network\n')
   net.start()
   info( '*** Set red options\n')
   s1.cmdPrint( 'tc qdisc add dev s1-eth2 root handle 1: red limit 29214400 max 15728640 min 5242880 burst 5243 avpkt 1000 bandwidth 1gbit adaptive ')

   info('*** Traffic generation\n')
   h2.cmdPrint('iperf3 -s -D -1 ')
   net.waitConnected()
   h1.cmdPrint('iperf3 -c', h2.IP(),'-J > iperf_result.json') 
 
   info( '*** Ping\n')
   h1.cmdPrint( 'ping -c 10', h2.IP(), '| grep "time=" | awk \'{print $5, $7}\' | sed -e \'s/time=//g\' -e\'s/icmp_seq=//g\' > ping.dat' )

   info( '*** Stopping network' )
   net.stop()

if __name__ == '__main__':
    setLogLevel( 'info' )
    emptyNet()

