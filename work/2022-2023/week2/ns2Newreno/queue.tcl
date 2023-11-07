#queue
set redq [[$ns link $node_(r1) $node_(r2)] queue]
set tchan_ [open output/all.q w]
$redq trace curq_
$redq trace ave_
$redq attach $tchan_
