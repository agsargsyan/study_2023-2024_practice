#queue
set redq [[$ns link $node_(r1) $node_(r2)] queue]
set tchan_ [open output/all.q w]
#$redq set thresh_ 10
#$redq set maxthresh_ 30
#$redq set linterm_ 10
#$redq set q_weight_ 0.002
$redq set drop-tail_ true
$redq set gentle_ false
$redq trace curq_
$redq trace ave_
$redq attach $tchan_
