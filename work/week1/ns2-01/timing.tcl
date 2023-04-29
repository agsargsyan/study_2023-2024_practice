#Задаём планировщик
$ns at 0.1 "$cbr start"
$ns at 1.0 "$ftp start"
$ns at 4.0 "$ftp stop"
$ns at 4.5 "$cbr stop"

#Отсоединить tcp и sink агенты
$ns at 4.5 "$ns detach-agent $n0 $tcp ; $ns detach-agent $n3 $sink"

# Вызвать finish на 5 секунде
$ns at 5.0 "finish"
