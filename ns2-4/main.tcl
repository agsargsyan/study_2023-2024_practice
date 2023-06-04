#Создать новый экземпляр объекта Symulator
set ns [new Simulator]

#Открыть трейс файл для nam, файл слишком большой, так что временно закомментируем
set nf [open output/out.nam w]
#$ns namtrace-all $nf

set N 20


source "nodes.tcl"
source "connections.tcl"
source "queue.tcl"
source "timing.tcl"
source "nam.tcl"
source "finish.tcl"                                                                                      


#Запуск программы
$ns run

 
