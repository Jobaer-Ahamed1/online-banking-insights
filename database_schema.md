create database online_banking;

create table region (
  region_id INTEGER,
  region_name VARCHAR(9)
);

INSERT INTO region
  (region_id, region_name)
VALUES
  ('1', 'Dhaka'),
  ('2', 'Khulna'),
  ('3', 'Rajshahi'),
  ('4', 'Sylhet'),
  ('5', 'Barishal');

create table area
(
    area_id int,
    name varchar(20)
)
insert into area values (1,'Union'),(2,'Upazila'),(3,'Pouroshova'),(4,'Ward'),(5,'Village')


-- You will get the data from excel (No need to execute the below DDL)
CREATE TABLE customer_joining_info(
  customer_id INTEGER,
  region_id INTEGER,
  area_id INTEGER,
  join_date DATE
);


-- You will get the data from excel (No need to execute the below DDL)
CREATE TABLE customer_transactions (
  customer_id INTEGER,
  txn_date DATE,
  txn_type VARCHAR(10),
  txn_amount INTEGER
);


---------------- KPIS ---------------------------
------------------------------------------------- 

1. How many unique customers are there?
2. How many unique customers are coming from each region?
3. How many unique customers are coming from each area?
4. What is the total amount for each transaction type?
5. For each month - how many customers make more than 1 deposit and 1 withdrawal in a single month?
6. What is closing balance for each customer?
7. What is the closing balance for each customer at the end of the month?
8. Please show the latest 5 days total withdraw amount.
9. Find out the total deposit amount for every five days consecutive series. You can assume 1 week = 5 days. 
	Please show the result week wise total amount.
10. Plase compare every weeks total deposit amount by the following previous wweek. 

	Example: Week 1 will be compared with Week 2 [Calculation Week2 - Week 1]-> Next week - previous week
		Week 2 will be compared with Week 3  [Calculation Week3 - Week 2]
