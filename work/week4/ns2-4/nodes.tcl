set node_(r0) [$ns node]
set node_(r1) [$ns node]

for {set i 0} {$i < $N} {incr i} {
	set node_(s$i) [$ns node]
	set node_(s[expr $N + $i]) [$ns node]
	}



 
