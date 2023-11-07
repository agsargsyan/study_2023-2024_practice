#Создать новый экземпляр объекта Symulator
set ns [new Simulator]

#Задаем разные цвета для потоков
$ns color 1 black
$ns color 2 red

#Открыть трейс-файл для nam
set nf [open ns2-01.nam w]
$ns namtrace-all $nf 

#Finish procedure
proc finish {} {
	global ns nf
	$ns flush-trace
	#Закрыть трейс-файл nam
	close $nf
	exit 0
}

#Create 4 nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

#Create links into nodes
$ns duplex-link $n0 $n2 2Mb 10ms DropTail
$ns duplex-link $n1 $n2 2Mb 10ms DropTail
$ns duplex-link $n2 $n3 1.7Mb 20ms DropTail

#Установим размер очереди на линке (n2-n3) в 10 пакетов
$ns queue-limit $n2 $n3 10

#Задаём расположение(для nam)
$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n1 $n2 orient right-up
$ns duplex-link-op $n2 $n3 orient right

#Задать монитор очереди(n2-n3) for nam
$ns duplex-link-op $n2 $n3 queuePos 0.5

#Установка TCP-соединение
set tcp [new Agent/TCP]
$tcp set class_ 2
$ns attach-agent $n0 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n3 $sink
$ns connect $tcp $sink
$tcp set fid_ 1

#Установим соединение FTP поверх TCP
set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ftp set type_ FTP

#Установим UDP-соединение
set udp [new Agent/UDP]
$ns attach-agent $n1 $udp
set null [new Agent/Null]
$ns attach-agent $n3 $null
$ns connect $udp $null
$udp set fid_ 2

#Установим соединение CBR поверх UDP
set cbr [new Application/Traffic/CBR]
$cbr attach-agent $udp
$cbr set type_ CBR
$cbr set packet_size_ 1000
$cbr set rate_ 1mb
$cbr set random_ false                                                                                          

#Задаём планировщик
$ns at 0.1 "$cbr start"
$ns at 1.0 "$ftp start"
$ns at 4.0 "$ftp stop"
$ns at 4.5 "$cbr stop"

#Отсоединить tcp и sink агенты
$ns at 4.5 "$ns detach-agent $n0 $tcp ; $ns detach-agent $n3 $sink"

# Вызвать finish на 5 секунде
$ns at 5.0 "finish"

#Напечатать размер пакета CBR и интервал
puts "CBR packet size = [$cbr set packet_size_]"
puts "CBR interval = [$cbr set interval_]"

#Запуск программы
$ns run

 
