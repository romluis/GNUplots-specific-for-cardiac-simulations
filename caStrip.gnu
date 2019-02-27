
#######################################
#GNUPLOT FILE caStrip.gnu 
#	.cpp file saves calcium load along a row of all CRU lattice in system for each pacing value T.
#	caStrip.gnu plots lattice site-vs-caLoad along a specific row of all CRU lattice in system. 
#	Row is specified during runtime and is saved in the first row of file 'lops.dat'. 
#
#FORMAT PARAMETERS RECIEVED FROM FILE
#	data_blocks: Total number of sample blocks (N) 
#	samplesPerSet : Number of samples in each set [set0]{1,2,..,n};[set1]{1,2,..,n};...set[N/n]{1,2,..,n}
#	lengthOfRow: Number of elements in sample row 
#	SETS : Number of samples
#######################################

	file = 'lpos.dat'
	stats file u 1:2 nooutput
	data_blocks = STATS_blocks-1
	samplesPerSet = system("head -1 " . file . " | awk '{print $1}'")
	lengthOfSample = system("head -1 " . file . " | awk '{print $2}'")
	SETS = ((data_blocks)/samplesPerSet)

#FORMAT CONSTANTS 
	set terminal png size 800, 500
	set border lw 2
	PS = 0.50
	eop = 2
	#set xrange [0 : 80000] noextend
	set yrange [0.5 : 0.9]
	unset xtics #...0,0,0 font ' bold,15'
	set ytics 0.6, 0.1, 0.8 font ' bold,15'
	set xlabel "" font ' bold,20'
	set ylabel "" font ' bold,20' offset 0.5, 1 

#PLOT Ca_Cable
do for[I = 1 : SETS]{
	set output sprintf('Ca_%o_%o.png',I,SETS)
	INDEX = (I-1)*samplesPerSet+1
	plot file index INDEX u 1 every eop w l lw PS lt rgb "black" title '', file index INDEX+1 u 1 every eop w l lw PS lt rgb "red" title ''}




