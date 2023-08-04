#! /usr/bin/gnuplot -persist
set terminal postscript eps enhanced adobeglyphnames
set output "test.ps"
set encoding utf8

set xrange [0:26]

set terminal postscript eps
set output "queues_1GNl.eps"
set xlabel "time [c]"
set ylabel "Queue Length [pkt]"
set title "Мгновенная очередь на линке при разных алгоритмах"
plot "classic.q" with lines linestyle 1 lt 1 lw 2 title "RED", "gentle.q" with lines linestyle 1 lt 2 lw 2 title "GRED", "nonlinear.q" with lines linestyle 1 lt 3 lw 2 title "NLRED" 

set terminal postscript eps
set output "queues_HTNl.eps"
set xlabel "time [c]"
set ylabel "Queue Length [pkt]"
set title "Мгновенная очередь на линке при разных алгоритмах"
plot "hyperbola.q" with lines linestyle 1 lt 1 lw 2 title "HRED", "3.q" with lines linestyle 1 lt 2 lw 2 title "TRED", "nonlinear.q" with lines linestyle 1 lt 3 lw 2 title "NLRED" 

set terminal postscript eps
set output "queues_adaptive.eps"
set xlabel "time [c]"
set ylabel "Queue Length [pkt]"
set title "Средневзвешенная очередь на линке при разных алгоритмах"
plot "ared.q" with lines linestyle 1 lt 1 lw 2 title "ARED", "rared.q" with lines linestyle 1 lt 2 lw 2 title "RARED", "fast.q" with lines linestyle 1 lt 3 lw 2 title "fast ARED" 
