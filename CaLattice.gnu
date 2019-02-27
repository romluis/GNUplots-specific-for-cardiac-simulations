#####PLOT CA lattice##########
set terminal png size 600, 475
SAMPLE_T = 0				# what sample of T pacing?
SAMPLE_size = 4         	# 4 recordings of each lattice
totalSystemLength = 800		# system cable length 
Xlen = 50
Ylen = 50

iteration = 0 #1,2,3
site_i = 0

set xrange[0:50]
set yrange[0:50]
unset tics
unset colorbox

IND = site_i + (totalSystemLength*iteration) + (SAMPLE_T*SAMPLE_size)
 
do for [i=IND:(IND+totalSystemLength)]{
	set output sprintf('CaLattice_%o_%o.png',i,SAMPLE_T)
	plot './gamma30/c_0.25/pos.dat' index i u 2:3:4 w image}



