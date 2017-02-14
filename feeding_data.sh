#!/bin/bash

if [ "$1" == "" ]; then
        INIT_DATE=`/usr/bin/perl -e '@T=localtime(time-(60*60*24*1));printf("%02d%02d%02d",$T[5]+1900,$T[4]+1,$T[3])'`
else
        INIT_DATE=$1;
fi

HOME_SH=/DIR HOME/DIR SCRIPT
DIR_SOURCE=/DIR INPUT
INPUT_1=${DIR_SOURCE}/FILE_NAME${INIT_DATE}.txt
INPUT_2=${HOME_SH}/1_FILE_FILTERED${INIT_DATE}.txt
INPUT_3=${HOME_SH}/2_FILE_SORTED${INIT_DATE}.txt
STAT_DIR=${HOME_SH}/STAT_FILE${INIT_DATE}.stat
export INIT_DATE HOME_SH DIR_SOURCE INPUT_1 INPUT_2 INPUT_3 OUT_DIR STAT_DIR

##### Proses 1 #####
filteredData(){
$COSORT_HOME/bin/sortcl /SPEC=${HOME_SH}/1_FILTERED.scl << END_FILTERED
echo "Proses Filtered Selesai"
END_FILTERED
}

##### Proses 2 #####
sortData(){
$COSORT_HOME/bin/sortcl /SPEC=${HOME_SH}/2_SORTED.scl << END_SORT
echo "Proses Sort Selesai"
END_SORT
}

##### Proses 3 #####
summaryData(){
$COSORT_HOME/bin/sortcl /SPEC=${HOME_SH}/3_SUMMARY.scl << END_SUMMARY
echo "Proses Summary Selesai"
END_SUMMARY
}

##### Proses 4 Feeding Data #####
feedingData(){
/usr/bin/ftp -ni IP HERE << END_FTP
user HOSTNAME PSSWD
lcd /DIR SOURCE
cd DIR DESTINATION
put FILE_NAME${INIT_DATE}.txt
echo "Feeding data selesai"
bye
END_FTP
}

filteredData
sortData
summaryData
feedingData
