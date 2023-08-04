# Создать новый экземпляр объекта Symulator
set ns [new Simulator]

# Открыть трейс файл для nam
set nf [open output/out.nam w]
$ns namtrace-all $nf

# Количество источников
set N 20

# Запуск программы
$ns run

set node_(r0) [$ns node]  ;# первый маршрутизатор
set node_(r1) [$ns node]  ;# второй маршрутизатор

# Глобальные переменные для хранения агентов
global udp_
global null_

for {set i 0} {$i < $N} {incr i} {
    set node_(s$i) [$ns node]      ;# источник
    set node_(s[expr $N + $i]) [$ns node]    ;# приемник

    # Создание агентов на узлах-источниках и приемниках
    set udp_($i) [new Agent/UDP]
    set null_($i) [new Agent/Null]

    # Прикрепление агентов к узлам
    $ns attach-agent $node_(s$i) $udp_($i)
    $ns attach-agent $node_(s[expr $N + $i]) $null_($i)

    # Связываем агенты для обмена данными
    $ns connect $udp_($i) $null_($i)
}

# ... (ваш текущий код)

# Мониторинг латентности
proc monitorLatency {srcNode dstNode outputChannel} {
    global ns start_time
    set now [$ns now]
    set latency [expr $now - $start_time]
    puts $outputChannel "$now $latency"
}

# Перед запуском программы добавим мониторинг латентности на агентах
for {set j 0} {$j < $N} {incr j} {
    set latencyFile [open "output/latency_src$j.out" w]
    $udp_($j) set fid_ $latencyFile
    $udp_($j) set dst [[$null_($j)] set address_]
    $udp_($j) monitorLatency $latencyFile
}

# ... (ваш текущий код)

# Мониторинг размера окна TCP
set windowVsTime [open output/WvsT w]
set qmon [$ns monitor-queue $node_(r0) $node_(r1) [open output/qm.out w]]
[$ns link $node_(r0) $node_(r1)] queue-sample-timeout

# ... (ваш текущий код)

# Finish procedure
proc finish {} {
    global ns nf start_time

    # Find the start time of the first source
    set start_time 0
    for {set i 0} {$i < $N} {incr i} {
        set src_start_time [$ftp($i) set starttime_]
        if {$start_time == 0 || $src_start_time < $start_time} {
            set start_time $src_start_time
        }
    }

    # ... (your existing code)

    # Вывод данных о латентности в xgraph
    for {set i 0} {$i < $N} {incr i} {
        set file [open "output/latency_src$i.out" r]
        set xgraphData [open "output/latency_src$i.xg" w]
        while {[gets $file line] >= 0} {
            set time [lindex $line 0]
            set latency [lindex $line 1]
            puts $xgraphData "$time $latency"
        }
        close $file
        close $xgraphData
    }

    # ... (your existing code)

    # вывод в xgraph
    exec xgraph -bb -tk -x time -t "TCPRenoCWND" output/WvsT &
    for {set i 0} {$i < $N} {incr i} {
        exec xgraph -bb -tk -x time -y "Latency (ms)" "output/latency_src$i.xg" &
    }
    exec xgraph -bb -tk -x time -y queue output/temp.queue &
    exit 0
}

#Задаем время симуляции
for {set r 0} {$r < $N} {incr r} {
    $ns at 0.0 "$ftp($r) start" 
    $ns at 1.0 "plotWindow $tcp($r) $windowVsTime"
    $ns at 24.0 "$ftp($r) stop"
}

$ns at 25.0 "finish"

