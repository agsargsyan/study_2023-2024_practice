all: clean ping.dat ping.pdf plot

ping.dat:
	sudo python lab_red.py
	sudo chown mininet:mininet ping.dat

ping.pdf: ping.dat
	  ./ping_plot

plot: iperf_result.json
	plot_iperf.sh iperf_result.json

clean:
	-rm -f *.dat *.pdf *.json *.csv
	-rm -rf results
