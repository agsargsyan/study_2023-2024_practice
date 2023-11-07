#Задаём планировщик
$ns at 0.0 "$ftp1 start"
$ns at 1.1 "plotWindow $tcp1 $windowVsTime"
$ns at 5.0 "$ftp2 start"
$ns at 15 "finish"
