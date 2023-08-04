#! /usr/bin/gnuplot -persist
set terminal postscript eps enhanced adobeglyphnames
set encoding utf8

set xrange [0:26]

set terminal postscript eps
set output "av_queues_1GNl.eps"
set xlabel "time [s]"
set ylabel "Queue Avg Length [pkt]"
set title "Средневзвешенная очередь на линке при разных алгоритмах"
plot "classic.a" with lines linestyle 1 lt 1 lw 2 title "RED", "gentle.a" with lines linestyle 1 lt 2 lw 2 title "GRED", "nonlinear.a" with lines linestyle 1 lt 3 lw 2 title "NLRED" 

set terminal postscript eps
set output "av_queues_HTNl.eps"
set xlabel "time [s]"
set ylabel "Queue Avg Length [pkt]"
set title "Средневзвешенная очередь на линке при разных алгоритмах"
plot "hyperbola.a" with lines linestyle 1 lt 1 lw 2 title "HRED", "3.a" with lines linestyle 1 lt 2 lw 2 title "TRED", "nonlinear.a" with lines linestyle 1 lt 3 lw 2 title "NLRED" 

set terminal postscript eps
set output "av_queues_adaptive1.eps"
set xlabel "time [s]"
set ylabel "Queue Avg Length [pkt]"
set title "Средневзвешенная очередь на линке при разных алгоритмах"
plot "ared.a" with lines linestyle 1 lt 1 lw 2 title "ARED", "rared.a" with lines linestyle 1 lt 2 lw 2 title "RARED", "fast.a" with lines linestyle 1 lt 4 lw 2 title "FARED"

set terminal postscript eps
set output "av_queues_adaptive2.eps"
set xlabel "time [s]"
set ylabel "Queue Avg Length [pkt]"
set title "Средневзвешенная очередь на линке при разных алгоритмах"
plot "ared.a" with lines linestyle 1 lt 1 lw 2 title "ARED", "powared.a" with lines linestyle 1 lt 3 lw 2 title "POWARED", "feng.a" with lines linestyle 1 lt 4 lw 2 title "Feng ARED"

set terminal postscript eps
set output "av_queues_adaptive3.eps"
set xlabel "time [s]"
set ylabel "Queue Avg Length [pkt]"
set title "Средневзвешенная очередь на линке при разных алгоритмах"
plot "rared.a" with lines linestyle 1 lt 1 lw 2 title "RARED", "fast.a" with lines linestyle 1 lt 3 lw 2 title "FARED"    
