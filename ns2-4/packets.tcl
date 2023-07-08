set packetLossFile [open output/packet_loss.txt w]

proc recordPacketLoss {time} {
    global ns receiverNodes packetLossFile
    set packetLoss 0
    foreach receiverNode $receiverNodes {
        set packetLoss [expr $packetLoss + [$receiverNode set totalDropped_]]
    }
    puts $packetLossFile "$time $packetLoss"
}

#node_(s[expr $N + $i])
