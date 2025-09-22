DROP IF EXISTS Zepto;
CREATE TABLE Zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discount_percent NUMERIC(5,2),
available_quantity INTEGER,
discounted_selling_price NUMERIC(8,2),
WeightinGMs INTEGER,
outofstocks BOOLEAN,
quantity INTEGER
)

--DATA EXPLORATION

SELECT * FROM Zepto

SELECT COUNT(*) FROM zepto

--Check if null value

SELECT * FROM Zepto
WHERE name IS NULL
or
category IS NULL
or
 mrp IS NULL
or
 discount_percent IS NULL
or
discounted_selling_price IS NULL
or
 weightingms IS NULL
or
 outofstocks IS NULL
or
 quantity IS NULL;

--stock_available vs stock unavailable

SELECT outofstocks, COUNT(sku_id)
FROM Zepto
GROUP BY outofstocks

--products name present multiple times
SELECT name,COUNT(sku_id) AS no_of_times_appeared
FROM Zepto
GROUP BY name
HAVING COUNT(sku_id) >1
ORDER BY no_of_times_appeared DESC LIMIT 5;


SELECT * FROM Zepto

--Data Cleaning

SELECT * FROM Zepto
WHERE mrp = 0 OR discount_price

DELETE FROM Zepto
WHERE mrp = 0

--convert paise to rupees
 UPDATE Zepto
 SET mrp = mrp/100.0,
 discounted_selling_price = discounted_selling_price/100.0

--top 10 best value product based on discount percent
SELECT name,mrp,discount_percent
FROM Zepto
ORDER BY discount_percent DESC LIMIT 10;

--products with high mrp but out of stocks
SELECT DISTINCT name,mrp
FROM Zepto
WHERE outofstocks = TRUE
ORDER BY mrp DESC LIMIT 3;

--calculate estimate revenue for each category
SELECT category , SUM(discounted_selling_price * available_quantity)
FROM Zepto
GROUP BY category;

--products with mrp greater tha 500 and discount less then 10%
SELECT DISTINCT name,mrp,discount_percent
FROM Zepto
WHERE mrp > 500 AND discount_percent < 10
ORDER BY mrp DESC,discount_percent DESC 

--top 5 category with highest avg discount percentage
SELECT category,ROUND(AVG(discount_percent),2) AS avg_disc
FROM Zepto
GROUP BY category 
ORDER BY avg_disc DESC
--find the price per gram for products above 100grams
SELECT DISTINCT name,weightingms,discounted_selling_price,
ROUND((discounted_selling_price/weightingms),2) AS price_per_gram
FROM Zepto
WHERE weightingms >= 100
ORDER BY price_per_gram 

--group product into categories like low medium bulk
SELECT DISTINCT name,weightingms,
CASE
 WHEN weightingms < 1000 THEN 'Low'
 WHEN weightingms < 5000 THEN 'Medium'
 ELSE 'Bulk'
 END AS weight_category
FROM Zepto

--total inventory weight per category
SELECT category,SUM(weightingms * available_quantity) AS total_weight
FROM Zepto
GROUP BY category
ORDER BY total_weight

























