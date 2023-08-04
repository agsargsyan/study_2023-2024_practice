#маршрутизаторы
set node_(r0) [$ns node]  
set node_(r1) [$ns node]  

#источники и приемники
for {set i 0} {$i < $N} {incr i} {
	set node_(s$i) [$ns node] 		
	set node_(s[expr $N + $i]) [$ns node]	
	}

#линки между маршрутизаторами и другими узлами(размер буфера, время, тип очереди)
for {set i 0} {$i < $N} {incr i} {
	$ns duplex-link $node_(s$i) $node_(r0) 100Mb 20ms DropTail
	$ns duplex-link $node_(s[expr $N + $i]) $node_(r1) 100Mb 20ms DropTail
}

#линки между маршрутизаторами(размер буфера, время, тип очереди)
$ns simplex-link $node_(r0) $node_(r1) 20Mb 15ms RED
$ns simplex-link $node_(r1) $node_(r0) 15Mb 20ms DropTail

# Агенты и приложения
for {set t 0} {$t < $N} {incr t} {
	$ns color $t green
	set tcp($t) [$ns create-connection TCP/Reno $node_(s$t) TCPSink $node_(s[expr $N + $t]) $t]
	$tcp($t) set window_ 32
	$tcp($t) set maxcwnd_ 32
	set ftp($t) [$tcp($t) attach-source FTP]
}
 
