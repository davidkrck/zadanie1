#!/bin/bash

if [ "$#" == 1 ]
then
	DAT="$(date -d yesterday +"%d-%m-%Y")"
	CITY="$1"
	D=$( echo $DAT | cut -f 1 -d "-" )
	M=$( echo $DAT | cut -f 2 -d "-" )
	Y=$( echo $DAT | cut -f 3 -d "-" )
	STARTT=$( date -d $M'/'$D'/'$Y +'%s' )
	ENDT=$( echo $STARTT + 24*60*60 | bc )
	URL=$( echo "https://aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=csv&stationString="$CITY"&startTime="$STARTT"&endTime="$ENDT )
	curl -s $URL | grep $CITY

elif [ "$#" == 2 ]
then
	DATE="$1"
  	CITY="$2"
        D=$( echo $DATE | cut -f 1 -d "-" )
        M=$( echo $DATE | cut -f 2 -d "-" )
        Y=$( echo $DATE | cut -f 3 -d "-" )
        STARTT=$( date -d $M'/'$D'/'$Y +'%s' )
        ENDT=$( echo $STARTT + 24*60*60 | bc )
        URL=$( echo "https://aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=csv&stationString="$CITY"&startTime="$STARTT"&endTime="$ENDT )
	curl -s $URL | grep $CITY 

else
	echo "bud 1 alebo 2 argumenty"
        break
fi
