#!/usr/bin/gnuplot -persist


set terminal postscript eps
set output "images/queues.eps"
set xlabel "Time (s)"
set ylabel "Queue Length"
set title "RED Queue"
plot "output/temp.q" with lines linestyle 1 lt 1 lw 2 title "Queue length", "output/temp.a" with lines linestyle 2 lt 3 lw 2 title "Average queue length"

set terminal postscript eps
set output "images/TCP.eps"
set xlabel "Time (s)"
set ylabel "Window size"
set title "TCPRenoVsWindow"
#plot "output/WvsT" with lines linestyle 1 lt 1 lw 2 title "WindowVsTimeReno"
