for {set i 0} {$i < $N} {incr i} {
	$ns duplex-link $node_(s$i) $node_(r0) 100Mb 20ms DropTail
	$ns duplex-link $node_(s[expr $N + $i]) $node_(r1) 100Mb 20ms DropTail
}

$ns simplex-link $node_(r0) $node_(r1) 20Mb 15ms RED
$ns simplex-link $node_(r1) $node_(r0) 15Mb 20ms DropTail




 
