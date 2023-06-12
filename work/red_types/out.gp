#!/usr/bin/gnuplot -persist

set xrange [0:20]

set terminal postscript eps
set output "queues_classic_nonlinear.eps"
set xlabel "Time [s]"
set ylabel "Queue Length [pkt]"
set title "Queues"
plot "gentle.q" with lines linestyle 1 lt 1 lw 2 title "classic", "nlr.q" with lines linestyle 2 lt 2 lw 2 title "nonlinear"

set terminal postscript eps
set output "av_queues_classic_nonlinear.eps"
set xlabel "Time [s]"
set ylabel "Queue length [pkt]"
set title "Average queues"
plot "gentle.a" with lines linestyle 1 lt 1 lw 2 title "classic", "nlr.a" with lines linestyle 2 lt 2 lw 2 title "nonlinear"   
