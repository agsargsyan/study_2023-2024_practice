#Создать новый экземпляр объекта Symulator
set ns [new Simulator]

#Открыть трейс файл для nam, файл слишком большой, так что временно закомментируем
set nf [open output/out.nam w]
$ns namtrace-all $nf

#количество источников 
set N 20

#создание узлов
source "nodes.tcl"

#очередь		
source "queue.tcl"

#настройка времени моделирования  		
source "timing.tcl" 		

#визуализация
source "nam.tcl"   		

#процедура finish
source "finish.tcl"                                                                         

#Запуск программы
$ns run

 
