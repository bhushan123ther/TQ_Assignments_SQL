use practice_db;
CREATE TABLE sales (
  id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  product_name VARCHAR(50) NOT NULL,
  category VARCHAR(50) NOT NULL,
  price NUMERIC(10, 2) NOT NULL,
  quantity INTEGER NOT NULL
);

INSERT INTO sales (date, product_name, category, price, quantity)
VALUES
  ('2022-01-01', 'Apple iPhone 13', 'Electronics', 1099.00, 2),
  ('2022-01-02', 'Samsung Galaxy S22', 'Electronics', 899.00, 3),
  ('2022-01-03', 'Sony Playstation 5', 'Gaming', 499.99, 1),
  ('2022-01-04', 'Microsoft Xbox Series X', 'Gaming', 499.99, 2),
  ('2022-01-05', 'Apple MacBook Pro', 'Computers', 1499.00, 1),
  ('2022-01-06', 'HP Elitebook 840', 'Computers', 999.00, 2),
  ('2022-01-07', 'Canon EOS R6', 'Cameras', 2499.00, 1),
  ('2022-01-08', 'Sony A7 III', 'Cameras', 1999.00, 2),
  ('2022-01-09', 'Nike Air Max 2090', 'Shoes', 150.00, 3),
  ('2022-01-10', 'Adidas Ultraboost', 'Shoes', 180.00, 4),
  ('2022-01-11', 'Tommy Hilfiger T-Shirt', 'Clothing', 29.99, 5),
  ('2022-01-12', 'Levi\'s 501 Jeans', 'Clothing', 79.50, 2),
  ('2022-01-13', 'Coca-Cola Classic', 'Beverages', 1.99, 10),
  ('2022-01-14', 'Pepsi Cola', 'Beverages', 1.50, 8),
  ('2022-01-15', 'Nestle Kit Kat', 'Snacks', 0.99, 20);  
  select * from sales;
  drop table sales;

-- Return total sales for each category
select category, sum(price * quantity) as Total_Sales
from sales 
group by category;

-- Return the number of sales made on each day
select date, count(id) as Number_of_Sales
from sales
group by date;

-- Returns the total revenue for each product
select product_name, sum(price*quantity) as Total_Revenue
from sales
group by product_name;

-- Return the average price for each product category
select category, avg(price) as Average_Price 
from sales
group by category; 

-- Return the highest sale for each category
select category , max(price * quantity) as Highest_Sale
from sales
group by category;

-- Return the number of sales for each product category
SELECT category, COUNT(*) AS num_sales
FROM sales
GROUP BY category;

-- Return the average price and quantity sold for each product
SELECT product_name, AVG(price) AS avg_price, AVG(quantity) AS avg_quantity
FROM sales
GROUP BY product_name;

-- Return the date of the first sale for each product
SELECT product_name, MIN(date) AS first_sale_date
FROM sales
GROUP BY product_name;

-- Return the average revenue per sale for each product
SELECT product_name, AVG(price * quantity) AS avg_revenue_per_sale
FROM sales
GROUP BY product_name;

-- Return the date of the last sale for each product
SELECT product_name, MAX(date) AS last_sale_date
FROM sales
GROUP BY product_name;

-- Return the total revenue and number of sales for each category
select category , sum(price * quantity) as Total_revenue , count(*) as num_sales
from sales
group by category;

-- Returns the highest sale for each product
SELECT product_name, MAX(price * quantity) AS highest_sale
FROM sales
GROUP BY product_name;



