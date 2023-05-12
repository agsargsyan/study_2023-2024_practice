#queue
set redq [[$ns link $node_(r1) $node_(r2)] queue]
set tchan_ [open output/all.q w]
$redq set thresh_ 50
$redq set maxthresh_ 70
$redq set linterm_ 10
$redq set q_weight_ 0.002
$redq set drop-tail_ true
$redq trace curq_
$redq trace ave_
$redq attach $tchan_
