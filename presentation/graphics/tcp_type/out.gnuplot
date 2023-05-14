#!/usr/bin/gnuplot -persist


set terminal postscript eps
set output "queues.eps"
set xlabel "Time (s)"
set ylabel "Queue Length"
set title "RED Queue"
plot "vegas.q" with lines linestyle 1 lt 1 lw 2 title "vegas", "newreno.q" with lines linestyle 2 lt 3 lw 2 title "newreno","reno.q" with lines linestyle 3 lt 4 lw 2 title "reno" 

set terminal postscript eps
set output "av_queues.eps"
set xlabel "Time (s)"
set ylabel "Queue Length"
set title "Average queues"
plot "vegas.a" with lines linestyle 1 lt 1 lw 2 title "vegas", "newreno.a" with lines linestyle 2 lt 3 lw 2 title "newreno","reno.a" with lines linestyle 3 lt 4 lw 2 title "reno" 
