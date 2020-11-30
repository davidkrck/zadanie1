#!/bin/bash

if [ "$#" == 2 ]
then
	DAT="$1"
	CITY="$2"
	D=$( echo $DAT | cut -f 1 -d "-" )
	M=$( echo $DAT | cut -f 2 -d "-" )
	Y=$( echo $DAT | cut -f 3 -d "-" )
	STARTT=$( date -d $M'/'$D'/'$Y +'%s' )
	ENDT=$( echo $STARTT + 24*60*60 | bc )
	URL=$( echo "https://aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=csv&stationString="$CITY"&startTime="$STARTT"&endTime="$ENDT )
	curl -s $URL | grep $CITY
else
	echo "nespravny pocet argumentov"
        break
fi
