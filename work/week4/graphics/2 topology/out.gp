#!/usr/bin/gnuplot -persist


set terminal postscript eps
set output "queues_tcp.eps"
set xlabel "Time (s)"
set ylabel "Queue Length"
set title "RED Queue"
plot "temp_vegas_75_150.q" with lines linestyle 1 lt 1 lw 2 title "vegas", "temp_newreno_75_150.q" with lines linestyle 1 lt 2 lw 2 title "newreno","temp_reno_75_150.q" with lines linestyle 1 lt 4 lw 2 title "reno" 

set terminal postscript eps
set output "av_queues_tcp.eps"
set xlabel "Time (s)"
set ylabel "Queue Length"
set title "Average queues"
plot "temp_vegas_75_150.a" with lines linestyle 1 lt 1 lw 2 title "vegas", "temp_newreno_75_150.a" with lines linestyle 1 lt 2 lw 2 title "newreno","temp_reno_75_150.a" with lines linestyle 1 lt 4 lw 2 title "reno"

set terminal postscript eps
set output "queues_maxthresh.eps"
set xlabel "Time (s)"
set ylabel "Queue Length"
set title "RED Queue"
plot "temp_reno_75_150.q" with lines linestyle 1 lt 1 lw 2 title "75-150", "temp_reno_100_200.q" with lines linestyle 1 lt 3 lw 2 title "100-200"  

set terminal postscript eps
set output "av_queues_maxthresh.eps"
set xlabel "Time (s)"
set ylabel "Queue Length"
set title "Average queues"
plot "temp_reno_75_150.a" with lines linestyle 1 lt 1 lw 2 title "75-150", "temp_reno_100_200.a" with lines linestyle 1 lt 3 lw 2 title "100-200"   
