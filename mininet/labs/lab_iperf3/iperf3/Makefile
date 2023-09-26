all: iperf_result.json plot

iperf_result.json:
	sudo python lab_iperf3.py

plot: iperf_result.json
	plot_iperf.sh iperf_result.json

clean:
	-rm -f *.json *.csv
	-rm -rf results
