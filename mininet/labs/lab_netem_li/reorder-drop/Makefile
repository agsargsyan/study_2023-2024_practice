all: ping.dat

ping.dat:
	sudo python lab_netem_li.py
	sudo chown mininet:mininet ping.dat
ping.png: ping.dat
	  ./ping_plot

clean:
	-rm -f *.dat 
