#Задаем разные цвета для потоков
$ns color 1 black
$ns color 2 red

#Открыть трейс-файл для nam
set nf [open ns2-01.nam w]
$ns namtrace-all $nf 

#Задаём расположение(для nam)
$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n1 $n2 orient right-up
$ns duplex-link-op $n2 $n3 orient right

#Задать монитор очереди(n2-n3) for nam
$ns duplex-link-op $n2 $n3 queuePos 0.5



 
