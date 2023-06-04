#!/usr/bin/gnuplot -persist

set xrange [0:20]

set terminal postscript eps
set output "queues_3types.eps"
set xlabel "Time [s]"
set ylabel "Queue Length [pkt]"
set title "Queues"
plot "classic.q" with lines linestyle 1 lt 1 lw 2 title "classic", "gentle.q" with lines linestyle 2 lt 2 lw 2 title "gentle", "adaptive.q" with lines linestyle 2 lt 2 lw 3 title "adaptive" 

set terminal postscript eps
set output "av_queues_3types.eps"
set xlabel "Time [s]"
set ylabel "Queue length [pkt]"
set title "Average queues"
plot "classic.a" with lines linestyle 1 lt 1 lw 2 title "classic", "gentle.a" with lines linestyle 2 lt 2 lw 2 title "gentle", "adaptive.a" with lines linestyle 2 lt 3 lw 2 title "adaptive"   
