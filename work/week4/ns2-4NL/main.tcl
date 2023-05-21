#Создать новый экземпляр объекта Symulator
set ns [new Simulator]

#Открыть трейс файл для nam
set nf [open output/out.nam w]
$ns namtrace-all $nf

set N 20


source "nodes.tcl"
source "links.tcl"
source "queue.tcl"
source "connections.tcl"
source "timing.tcl"
source "nam.tcl"
source "finish.tcl"                                                                                      


#Запуск программы
$ns run

 
