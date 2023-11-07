
#создаем симулятор
set ns [new Simulator]
#Открыть трейс-файл для nam
set nf [open output/out.nam w]
$ns namtrace-all $nf

#создаем узлы
set node_(s1) [$ns node]
set node_(s2) [$ns node]
set node_(r1) [$ns node]
set node_(r2) [$ns node]
set node_(s3) [$ns node]
set node_(s4) [$ns node]

#Создаем линки
$ns duplex-link $node_(s1) $node_(r1) 10Mb 2ms DropTail
$ns duplex-link $node_(s2) $node_(r1) 10Mb 3ms DropTail
$ns duplex-link $node_(r1) $node_(r2) 1.5Mb 20ms RED
$ns queue-limit $node_(r1) $node_(r2) 25
$ns queue-limit $node_(r2) $node_(r1) 25
$ns duplex-link $node_(s3) $node_(r2) 10Mb 4ms DropTail
$ns duplex-link $node_(s4) $node_(r2) 10Mb 5ms DropTail

#Задаем разные цвета для потоков
$ns color 1 Blue
$ns color 0 Red
#отображение в nam
$ns duplex-link-op $node_(s1) $node_(r1) orient right-down
$ns duplex-link-op $node_(s2) $node_(r1) orient right-up
$ns duplex-link-op $node_(r1) $node_(r2) orient right
$ns duplex-link-op $node_(r1) $node_(r2) queuePos 0
$ns duplex-link-op $node_(r2) $node_(r1) queuePos 0
$ns duplex-link-op $node_(s3) $node_(r2) orient left-down
$ns duplex-link-op $node_(s4) $node_(r2) orient left-up


#Строим соединение
set tcp1 [$ns create-connection TCP/Reno $node_(s1) TCPSink $node_(s3) 0]
$tcp1 set window_ 15
set tcp2 [$ns create-connection TCP/Reno $node_(s2) TCPSink $node_(s3) 1]
$tcp2 set window_ 15
set ftp1 [$tcp1 attach-source FTP]
set ftp2 [$tcp2 attach-source FTP]
#TCP window
set windowVsTime [open output/WvsT w]
set qmon [$ns monitor-queue $node_(r1) $node_(r2) [open output/qm.out w] 0.1];
[$ns link $node_(r1) $node_(r2)] queue-sample-timeout;
proc plotWindow {tcpSource file} {
global ns
set time 0.01
set now [$ns now]
set cwnd [$tcpSource set cwnd_]
puts $file "$now $cwnd"
$ns at [expr $now+$time] "plotWindow $tcpSource $file"
}

#queue
set redq [[$ns link $node_(r1) $node_(r2)] queue]
set tchan_ [open output/all.q w]
$redq trace curq_
$redq trace ave_
$redq attach $tchan_

#Задаём планировщик
$ns at 0.0 "$ftp1 start"
$ns at 1.1 "plotWindow $tcp1 $windowVsTime"
$ns at 3.0 "$ftp2 start"
$ns at 10 "finish"

#Поставим процедуру "Finish"
proc finish {} {
global ns nf
$ns flush-trace
#Закрыть трейс-файл nam
close $nf
global tchan_
#графики для мгновенной и средневзвешанной экспоненциальной очереди в xgraph
set awkCode {
{
if ($1 == "Q" && NF>2) {
print $2, $3 >> "output/temp.q";
set end $2
}
else if ($1 == "a" && NF>2)
print $2, $3 >> "output/temp.a";
}
}
set f [open output/temp.queue w]
puts $f "TitleText: RED"
puts $f "Device: Postscript"
if { [info exists tchan_] } {
close $tchan_
}
#Удалим предыдущие временные файлы при их наличии
exec rm -f output/temp.q output/temp.a
exec touch output/temp.a output/temp.q
exec awk $awkCode output/all.q
puts $f \"queue
exec cat output/temp.q >@ $f
puts $f \n\"ave_queue
exec cat output/temp.a >@ $f
close $f
exec xgraph -bb -tk -x time -y queue output/temp.queue &
exec xgraph -bb -tk -x time -t "TCPRenoCWND" output/WvsT &
exit 0
}


$ns run
