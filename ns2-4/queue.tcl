$ns queue-limit $node_(r0) $node_(r1) 300
$ns queue-limit $node_(r1) $node_(r0) 300

set windowVsTime [open output/WvsT w]
set qmon [$ns monitor-queue $node_(r0) $node_(r1) [open output/qm.out w]]
[$ns link $node_(r0) $node_(r1)] queue-sample-timeout

set redq [[$ns link $node_(r0) $node_(r1)] queue]
$redq set thresh_ 200
$redq set maxthresh_ 500
$redq set q_weight_ 0.002
$redq set linterm_ 10
$redq set gentle_ false 
$redq set drop-tail_ true
#$redq set adaptive_ 0
#$redq set refined_adaptive_ 1
#$redq set edp_.nonlinear 1 
$redq set queue-in-bytes false
set tchan_ [open output/all.q w]
$redq trace curq_
$redq trace ave_
$redq attach $tchan_
