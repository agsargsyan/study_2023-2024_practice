#queue
set redq [[$ns link $node_(r1) $node_(r2)] queue]
set tchan_ [open output/all.q w]
$redq set thresh_ 10
$redq set maxthresh_ 100
$redq set linterm_ 10
$redq set q_weight_ 0.002
$redq trace curq_
$redq trace ave_
$redq attach $tchan_
