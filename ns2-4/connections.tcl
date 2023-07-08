for {set t 0} {$t < $N} {incr t} {
	$ns color $t green
	set tcp($t) [$ns create-connection TCP/Reno $node_(s$t) TCPSink $node_(s[expr $N + $t]) $t]
	$tcp($t) set window_ 32
	$tcp($t) set maxcwnd_ 32
	set ftp($t) [$tcp($t) attach-source FTP]
}

proc plotWindow {tcpSource file} {
   global ns
   set time 0.01
   set now [$ns now]
   set cwnd [$tcpSource set cwnd_]
   puts $file "$now $cwnd"
   $ns at [expr $now+$time] "plotWindow $tcpSource $file"
}


