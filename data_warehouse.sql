create database onlinebanking_warehouse 

-- 1. How many unique customers are there?

select * from customer_transactions;

select count(customer_id) from customer_transactions  

select count(distinct customer_id) as total_customers from customer_transactions 

select count(distinct customer_id) from customer_joining_info cji 

-- 2. How many unique customers are coming from each region? 

select r.region_id,r.region_name,count(distinct cij.customer_id) as customer from region r 
join customer_joining_info as cij on r.region_id =cij.region_id 
group by r.region_id ,r.region_name 


-- 3. How many unique customers are coming from each area?

select a.area_id ,a.name ,count(distinct cij.customer_id) as customer_per_area from area a 
join customer_joining_info as cij on a.area_id =cij.area_id 
group by a.area_id ,a.name

-- 4. What is the total amount for each transaction type?

select txn_type,sum(txn_amount) as total_txn from customer_transactions ct
group by txn_type 


-- 5. For each month - how many customers make more than 1 deposit and 1 withdrawal in a single month?

select MONTH(STR_TO_DATE(txn_date, '%m/%d/%Y')) AS mon,count(customer_id) as total_cus from customer_transactions ct 
group by mon
having count(txn_type) >1

-- 7. What is the closing balance for each customer at the end of the month?

select customer_id ,MONTH(STR_TO_DATE(txn_date, '%m/%d/%Y')) AS mon,sum(txn_amount) as total_amount from customer_transactions ct

group by customer_id,mon  



-- 8. Please show the latest 5 days total withdraw amount
select STR_TO_DATE(txn_date, '%m/%d/%Y') AS date,sum(txn_amount) as latest_5days_withdrawamount from customer_transactions ct 
where txn_type='withdrawal'
group by date
order by date desc 
limit 5

-- 9. Find out the total deposit amount for every five days consecutive series. You can assume 1 week = 5 days. 
	-- Please show the result week wise total amount. 

/*select floor(week(str_to_date(txn_date,'%m/%d/%y'),1)*7/5)as week , sum(txn_amount) as total_per_week
from customer_transactions ct 
where txn_type ='deposit'
group by week */

select floor((datediff(str_to_date(txn_date,'%m/%d/%y'),'2020-01-01')/5))as week , sum(txn_amount) as total_deposit
from customer_transactions ct 
where txn_type ='deposit'
group by week 
order by week 

/*SELECT MIN(STR_TO_DATE(txn_date, '%m/%d/%Y')) AS min_date
FROM customer_transactions;*/

/*10. Plase compare every weeks total deposit amount by the following previous wweek. 

	Example: Week 1 will be compared with Week 2 [Calculation Week2 - Week 1]-> Next week - previous week
		Week 2 will be compared with Week 3  [Calculation Week3 - Week 2]*/

with weekly_Deposit as (select floor((datediff(str_to_date(txn_date,'%m/%d/%y'),'2020-01-01')/5))as week , sum(txn_amount) as total_deposit
from customer_transactions ct 
where txn_type ='deposit'
group by week 
order by week) 
select wd.week,wd.total_deposit,
coalesce(wd.total_deposit - lag(wd.total_deposit) over(order by wd.week),0) as deposit_change
from weekly_Deposit as wd 
order by wd.week 





