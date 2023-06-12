#!/usr/bin/gnuplot -persist


set terminal postscript eps
set output "queues.eps"
set xlabel "Time [s]"
set ylabel "Queue Length [pkt]"
set title "Queues"
plot "classic.q" with lines linestyle 1 lt 1 lw 2 title "classic RED", "gentle.q" with lines linestyle 2 lt 2 lw 2 title "Gentle RED"

set terminal postscript eps
set output "av_queues.eps"
set xlabel "Time (s)"
set ylabel "Queue length [pkt]"
set title "Average queues"
plot "classic.a" with lines linestyle 1 lt 1 lw 2 title "classic RED", "gentle.a" with lines linestyle 2 lt 2 lw 2 title "Gentle RED"
