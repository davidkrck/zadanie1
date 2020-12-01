#!/bin/bash
cat << THE_END  
set terminal wxt
set xdata time
set timefmt "%H-%M"
set xtics format "%H:%M"
plot '-' using 1:2 with boxes
THE_END

while read LINE
do
	CAS=$(echo $LINE | cut -f 3 -d , | cut -c12-16 | tr : - )
	TEPLOTA=$(echo $LINE | cut -f 6 -d , )	
	echo "$CAS" " " "$TEPLOTA"
done

cat << THE_END
e
THE_END
