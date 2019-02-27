#################APD system file
	file = 'apos.dat'
	stats file u 1:2 nooutput
	data_blocks = STATS_blocks-1
	sampleSets = system("head -1 " . file . " | awk '{print $1}'")
	sizeOfSamples = system("head -1 " . file . " | awk '{print $2}'")
	SETS = ((data_blocks)/sampleSets)

#################
	set terminal png size 800, 500
	set border lw 2
	I = 0
	linWth = 3 
	set xrange [0 : sizeOfSamples] noextend
	set yrange [150 : 230]
	set xtics 400,400,800 font ' bold,15'
	set ytics 170,20,230 font ' bold,15'
	#set xlabel "site" font ' bold,20'
	#set ylabel "APD (ms.)" font ' bold,20' offset 0.5,1 

#################
do for[I=1:SETS]{
	set output sprintf('apd_%o_%o.png',I,SETS)
	INDEX = (I-1)*sampleSets+1
	plot file index INDEX u 3:4 w l lw linWth lt 2 lc rgb "black" title '', file index INDEX+1 u 3:4 w l lw linWth lt 2 lc rgb "red" title ''
}






