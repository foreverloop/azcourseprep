--hive queries for disease data


--question 1 OK
CREATE DATABASE IF NOT EXISTS chronDB;
USE chronDB;

CREATE TABLE IF NOT EXISTS statdis(
`YearStart` INT,	
`YearEnd`	INT,
`LocationAbbr` string, --state initials
`LocationDesc` string, --state full name
`DataSource` string, --categorical
`Topic` string, --disease (categorical)
`Question` string, --details of disease, mixed with response
`Response` string, --empty, seems to be tied into question
`DataValueUnit` string, --Really an INT
`DataValueType` string, --categorical
`DataValue` FLOAT, --real value, maybe double
`DataValueAlt` FLOAT, --real value, maybe double
`DataValueFootnoteSymbol`	string, --miscellanious
`DatavalueFootnote` string, --Extra notes
`LowConfidenceLimit` FLOAT, --real value
`HighConfidenceLimit`	FLOAT, --real value
`StratificationCategory1`	string, --categorical
`Stratification1`	string, --categorical
`StratificationCategory2`	string,
`Stratification2`	string,
`StratificationCategory3` string,	
`Stratification3`	string,
`GeoLocation`	string, --maybe extract to int
`ResponseID` INT, --sparse, very likely int though
`LocationID` INT, --
`TopicID`	string, 
`QuestionID` string,
`DataValueTypeID`	string,
`StratificationCategoryID1` string,--Same as issue 3, but maybe it helps in issue 3 also
`StratificationID1` string,
`StratificationCategoryID2` string,	
`StratificationID2` string,
`StratificationCategoryID3` string,	
`StratificationID3` string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

--proof of MetaException(message:One or more instances could not be made persistent), some permissions issue
--ALTER TABLE statdis ADD CONSTRAINT constraint_name PRIMARY KEY (TopicID) DISABLE NOVALIDATE;

LOAD DATA LOCAL INPATH '/home/hadoop/chronic_disease.csv' INTO TABLE statdis;

--question 2, all unique tuples OK
SELECT DISTINCT * FROM statdis;

--question 3, all states Low/HighConfidenceLimits OK
SELECT statdis.locationabbr, 
AVG(statdis.LowConfidenceLimit), 
AVG(statdis.HighConfidenceLimit)
FROM statdis GROUP BY statdis.locationabbr;

--question 4 OK
SELECT statdis.Topic FROM statdis 
WHERE statdis.YearStart = 2016 
AND statdis.LocationDesc = 'Texas' 
AND statdis.LowConfidenceLimit > 60;

--question 5 OK (more complete version)
hive -e "USE chrondb; SELECT statdis.YearStart, statdis.locationdesc,statdis.locationabbr, COUNT(statdis.TopicID) 
FROM statdis GROUP BY statdis.locationdesc,statdis.locationabbr, statdis.YearStart;" > /home/hadoop/outfiles/question_5a.txt


--question 6 OK (but used minimal Hadoop/Hive for this, result in .ipynb) (output and graph geocords in matplotlib)
hive -e "SELECT statdis.GeoLocation FROM statdis" > /home/hadoop/outfiles/question_6.txt

--question 7 primary index (partial, complete later)
select reflect("java.util.UUID", "randomUUID") 

