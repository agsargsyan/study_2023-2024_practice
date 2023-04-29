#Создать новый экземпляр объекта Symulator
set ns [new Simulator]

source "finish.tcl"
source "nodes.tcl"
source "links.tcl"
source "queue.tcl"
source "nam.tcl"
source "connections.tcl"
source "timing.tcl"                                                                                      

#Напечатать размер пакета CBR и интервал
puts "CBR packet size = [$cbr set packet_size_]"
puts "CBR interval = [$cbr set interval_]"

#Запуск программы
$ns run

 
