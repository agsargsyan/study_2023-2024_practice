for {set r 0} {$r < $N} {incr r} {
	$ns at 0.0 "$ftp($r) start"
	$ns at 1.0 "plotWindow $tcp($r) $windowVsTime"
	$ns at 24.0 "$ftp($r) stop"
}

$ns at 25.0 "finish"
