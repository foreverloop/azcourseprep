#!/usr/bin/env bash
#cleanup disease csv shell script

#replace " with nothing for all instances on a line and output to a new file
#sed "s/\"//g" header_only.csv > header_sed.csv

#extract just the mortality/incidence data from this
#awk -F',' '{print $8}' header_sed.csv > awk_out_test.csv

sed "s/\"//g" header_only.csv | awk -F',' '{print $8}' > responses.csv

#sed "s/\"//g" header_only.csv | awk -F',' 'BEGIN { OFS = "," } {print $8}' > header_only.csv

#deal with the comma in this thing
sed "s/per 100,000/100000/g" header_only.csv > noquo.csv

#get rid of the quotes from all of it now so that response falls in line
sed "s/\"//g" noquo.csv > response_ok.csv