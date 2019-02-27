set term png

FILES = system("ls -1 apos*.dat")
LABEL = system("ls -1 apos*.dat")

#set xrange[410:610]
#set yrange[140:290]

do for [i=1:words(FILES)]{
set output sprintf('%s.png',word(LABEL,i))
plot word(FILES,i) u 5:6 pt 7 lc -1  title ''}
