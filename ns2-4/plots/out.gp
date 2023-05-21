#!/usr/bin/gnuplot -persist
set xrange [0:20]

set terminal postscript eps
set output "av_queues_maxthresh.eps"
set xlabel "Time [s]"
set ylabel "Queue Length [pkt]"
set title "Average queues"
plot "temp75-150.a" with lines linestyle 1 lt 1 lw 2 title "75-150", "temp75-100.a" with lines linestyle 1 lt 2 lw 2 title "75-100", "temp25-100.a" with lines linestyle 1 lt 3 lw 2 title "25-100" 

set terminal postscript eps
set output "av_queues_red_types.eps"
set xlabel "Time [s]"
set ylabel "Queue Length [pkt]"
set title "Average queues"
plot "temp_classic.a" with lines linestyle 1 lt 1 lw 2 title "classic", "temp_adaptive.a" with lines linestyle 1 lt 2 lw 2 title "adaptive", "temp_RARED.a" with lines linestyle 1 lt 3 lw 2 title "refined adaptive" 

set terminal postscript eps
set output "av_queues_tcp.eps"
set xlabel "Time [s]"
set ylabel "Queue Length [pkt]"
set title "Average queues"
plot "temp_vegas.a" with lines linestyle 1 lt 4 lw 2 title "vegas", "temp_reno.a" with lines linestyle 1 lt 2 lw 2 title "reno", "temp_newreno.a" with lines linestyle 1 lt 1 lw 2 title "newreno" 
