-- Create database
CREATE DATABASE IF NOT EXISTS superstore;

use superstore;


-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT NOT NULL,
    total DECIMAL(12,4) NOT NULL,
    odate DATE NOT NULL,
    otime TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT,
    gross_income DECIMAL(12, 4),
    rating FLOAT
);



-- EXTRACT YEAR FROM DATE
select odate, year(odate) from sales;
-- add year column 
alter table sales add column oyear int not null;
update sales set oyear = year(odate);

-- extract months from date
select odate, monthname(odate) from sales; 
-- add month column
alter table sales add column omonth varchar(20) not null;
update sales set omonth = monthname(odate) ;

-- extract dayname from date
select otime, dayname(otime) from sales;
-- add  day_name column
alter table sales add column oday_name varchar(20) not null; 
update sales set oday_name =dayname(odate) ;

-- divide time in three categories
select otime from sales;
select otime,
(case 
	when otime between "00:00:00" and "12:00:00" then "MORNING"
    when otime between "12:00:01" and "16:00:00" then "AFTERNOON"
    else "EVENING"
end) AS time_of_day
from sales;
-- add time of day column
alter table sales add column time_of_day varchar(20) not null;
update sales set time_of_day = (case 
	when otime between "00:00:00" and "12:00:00" then "MORNING"
    when otime between "12:00:01" and "16:00:00" then "AFTERNOON"
    else "EVENING"
end) ;




-- DISTINCT BREANCH
select distinct(branch) from sales;  -- A,C,b

-- DISTINCT CITY
select distinct(city) from sales;    -- yangon,naypyitaw,mandalay

-- DISTINCT CUSTOMER_TYPE 
select distinct(customer_type) from sales;  -- normal,member

-- DISTINCT PRODUCT_LINE
select distinct(product_line) from sales;  -- food & brverages,health & beauty,sports & travel,fashions accessories,home & lifstyle,electtronic accessories

-- DISTINCT PAYMENT TYPE
select distinct(payment) as payment_mode from sales; -- credit card,ewallet,cash

-- What is the most selling product line
select product_line,sum(quantity) as Qty from sales group by product_line order by Qty desc;  -- Electronic Accessories  971

-- What product line had the largest revenue
select product_line,sum(total) as Revenue from sales group by product_line order by Revenue desc; -- Food and beverages	56144.8440

-- What product line had the largest tax_pct
select product_line,sum(tax_pct) as VAT from sales group by product_line order by VAT desc; -- Food and beverages	2673.563990712166

-- What product line had the largest cogs
select product_line,sum(cogs) as COGS from sales group by product_line order by COGS desc; -- Food and beverages	53471.28

-- What is the average rating of each product line
select product_line,round(avg(rating),1) as Rating from sales group by product_line order by Rating desc; -- Food and beverages	7.1

select product_line,sum(quantity) from sales where city='Yangon' group by product_line ;
-- -- Food and beverages	313
-- Fashion accessories	263
-- Sports and travel	333
-- Home and lifestyle	371
-- Health and beauty	257
-- Electronic accessories	322



-- What is the total revenue by month
select omonth as Month,sum(total) as TotalRevenue from sales group by Month order by TotalRevenue desc; -- January	116291.8680

-- What month had the largest tax pct
select omonth as Month,sum(tax_pct) as VAT from sales group by Month order by VAT desc; -- January	5537.708010196686

-- What month had the largest COGS
select omonth as Month,sum(cogs) as COGS from sales group by Month order by COGS desc; -- January	110754.16

-- What is the city with the largest revenue
select city,sum(total) as Revenue from sales group by city order by Revenue desc; -- Naypyitaw	110568.7065

-- Which city has the largest tax percent
select city,sum(tax_pct) as tax from sales group by city order by tax desc ; -- Naypyitaw	5265.176480472088

-- What is the branch with the largest revenue
select branch,sum(total) as Revenue from sales group by branch order by Revenue desc; -- C	110568.7065

-- Which branch has the largest tax percent
select branch,sum(tax_pct) as tax from sales group by branch order by tax desc ; -- C	5265.176480472088

-- Which of the customer types brings the most revenue
select customer_type,sum(total) as Revenue from sales group by customer_type order by Revenue; -- Normal	158743.3050

-- Which of the customer types brings the most tax percent
select customer_type,sum(tax_pct) as tax from sales group by customer_type order by tax desc ; -- Member	7820.163996100426

-- What is the most common customer type
select customer_type,count(invoice_id) as icount from sales group by customer_type order by icount desc; -- Member	501

-- Which is the customer type buy most quantity 
select customer_type,sum(quantity) as QTY from sales group by customer_type order by QTY desc; -- Member	2785

-- What is the gender of most of the customers
select gender,count(invoice_id) as icount from sales group by gender order by icount desc;  -- Female	501

-- Which  is the gender give  most of the revenue
select gender,sum(total) as Revenue from sales group by gender order by Revenue desc; -- Female	167882.9250

-- Which month customers give most revenue
select omonth,sum(total) as Revenue from sales group by omonth order by Revenue desc; -- January	116291.8680

-- which month get most tax
select omonth,sum(tax_pct) as tax from sales group by omonth order by tax  desc; -- January	5537.708010196686

-- which month customer give most rating
select omonth,round(avg(rating),1) as rating from sales group by omonth order by rating desc; -- February	7.1

-- Which time of the day do customers give most ratings
select time_of_day,round(avg(rating),2) as rating from sales group by time_of_day order by rating desc; -- AFTERNOON	7.03

-- which day name customer give most rating
select oday_name as day_name,round(avg(rating),1) as rating from sales group by day_name order by rating desc; -- Monday	7.2

-- which time of day customors shoping most
select time_of_day,count(invoice_id) as icount from sales group by time_of_day order by icount desc; -- EVENING	432

-- Which time of the day do customers give most revenue
select time_of_day,sum(total) as Revenue from sales group by time_of_day order by Revenue desc; -- EVENING	138370.9215

-- Which day customers give most revenue
select oday_name as day_name,count(invoice_id) as icount from sales group by day_name order by icount desc; -- Saturday	164

-- which is the most used payment type
select payment,count(*) as payment_type from sales group by payment order by payment_type desc; -- Ewallet	345



select * from sales;



