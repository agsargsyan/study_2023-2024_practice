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
	exec xgraph -bb -tk -x time -t "TCPVegasCWND" output/WvsT &
	exit 0
}
