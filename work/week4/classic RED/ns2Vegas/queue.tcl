#queue
set redq [[$ns link $node_(r1) $node_(r2)] queue]
set tchan_ [open output/all.q w]
$redq thresh_ 50
$redq maxthresh_ 100
$redq linterm_ 10
$redq q_weight_ 0.002
$redq trace curq_
$redq trace ave_
$redq attach $tchan_
