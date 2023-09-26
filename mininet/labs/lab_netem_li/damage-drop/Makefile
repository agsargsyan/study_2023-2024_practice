all: ping.dat 

ping.dat:
	sudo python lab_netem_li.py
	sudo chown mininet:mininet ping.dat
ping.png: ping.dat
	  

clean:
	-rm -f *.dat 
