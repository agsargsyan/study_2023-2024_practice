# Создание нового экземпляра объекта Simulator
set ns [new Simulator]

# Открытие трейс файла для nam
set nf [open output/out.nam w]
$ns namtrace-all $nf

set N 20

# Создание узлов отправителей и получателя
set node_(r0) [$ns node]
set node_(r1) [$ns node]

for {set i 0} {$i < $N} {incr i} {
    set node_(s$i) [$ns node]
    set node_(s[expr $N + $i]) [$ns node]
}

# Создание каналов связи между отправителями и получателем
for {set i 0} {$i < $N} {incr i} {
    $ns duplex-link $node_(s$i) $node_(r0) 100Mb 20ms DropTail
    $ns duplex-link $node_(s[expr $N + $i]) $node_(r1) 100Mb 20ms DropTail
}

$ns simplex-link $node_(r0) $node_(r1) 20Mb 15ms RED
$ns simplex-link $node_(r1) $node_(r0) 15Mb 20ms DropTail

# Создание TCP соединений и источников FTP трафика
for {set t 0} {$t < $N} {incr t} {
    set tcp($t) [$ns create-connection TCP/Reno $node_(s$t) TCPSink $node_(s[expr $N + $t]) $t]
    $tcp($t) set window_ 32
    $tcp($t) set maxcwnd_ 32
    set ftp($t) [$tcp($t) attach-source FTP]
}

# Создание очередей на каналах связи
$ns queue-limit $node_(r0) $node_(r1) 300
$ns queue-limit $node_(r1) $node_(r0) 300

# Создание файла для записи количества потерянных пакетов со временем
set packetLossFile [open output/packet_loss.txt w]

# Функция для записи количества потерянных пакетов
proc recordPacketLoss {} {
    global ns node_ packetLossFile
    set packetLoss 0
    foreach receiverNode [concat $node_(r0) $node_(r1)] {
        set packetLoss [expr $packetLoss + [$receiverNode set totalDropped_]]
    }
    puts $packetLossFile "$packetLoss"
}

# Запуск записи количества потерянных пакетов каждую секунду
$ns at 1.0 "recordPacketLoss"

# Функция для вывода графика количества потерянных пакетов со временем
proc plotPacketLoss {file} {
    exec xgraph -bb -tk -x time -y "Packet Loss" $file &
}

# Запуск вывода графика количества потерянных пакетов каждые 5 секунд
$ns at 5.0 "plotPacketLoss output/packet_loss.txt"

# Завершение симуляции и вывод результатов
proc finish {} {
    global ns nf packetLossFile
    $ns flush-trace
    close $nf
    close $packetLossFile
    exec xgraph -bb -tk -x time -y "Packet Loss" output/packet_loss.txt &
    exec nam output/out.nam &
    exit 0
}

$ns at 25.0 "finish"

# Запуск симуляции
$ns run

