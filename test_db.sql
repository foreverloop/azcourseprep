--to view detailed hive error logs (on linux, not hdfs)
--/tmp/hadoop/hive.log
CREATE DATABASE IF NOT EXISTS testDB;

USE testDB;

CREATE TABLE IF NOT EXISTS customer(
`custID` INT,
`cname` string,
`cgroup` string,
PRIMARY KEY (custID) DISABLE NOVALIDATE
)ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

--plan B
USE testDB;
CREATE TABLE IF NOT EXISTS customer(
`custID` INT,
`cname` string,
`cgroup` string
)ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INPATH '/home/hadoop/customer_t.csv' INTO TABLE customer;
select * from customer;
ALTER TABLE customer ADD CONSTRAINT `custID_KEY_PK` PRIMARY KEY (custID) DISABLE NOVALIDATE;

--ALTER TABLE TableName add customerid int identity(1,1)

CREATE TABLE IF NOT EXISTS orders(
	orID INT,
	ocost float,
	oitem
	custid INT
	PRIMARY KEY (orID) DISABLE NOVALIDATE
)ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


