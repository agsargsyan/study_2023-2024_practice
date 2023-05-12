#создаем симулятор
set ns [new Simulator]

#Открыть трейс-файл для nam
set nf [open output/out.nam w]
$ns namtrace-all $nf

source "node.tcl"
source "link.tcl"
source "connections.tcl"
source "queue.tcl"
source "timing.tcl"
source "nam.tcl"
source "finish.tcl"

$ns run


















 
