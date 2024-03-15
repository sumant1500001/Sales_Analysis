Use pizza_db;

-- A. KPI's

-- Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza;
-- Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza;
-- Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza;
--  Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza;
-- Average Pizzas Per Order
SELECT ROUND((SUM(quantity)*10000) / COUNT(DISTINCT order_id),2 )
AS Avg_Pizzas_per_order
FROM pizza;


-- B. Daily Trend for Total Orders

SELECT DAYNAME( order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza
GROUP BY DAYNAME(order_date)
order by total_orders desc;


-- C. Monthly Trend for Total Orders

SELECT MONTHNAME( order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza
GROUP BY MONTHNAME(order_date)
order by total_orders desc;


-- D. % of Sales by Pizza Category
SELECT pizza_category, ROUND(SUM(total_price) ,2) as total_revenue,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza),2) AS PCT
FROM pizza
GROUP BY pizza_category
order by pizza_category desc;

-- E. % of Sales by Pizza Size
SELECT pizza_size, ROUND(SUM(total_price) ,2) as total_revenue,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza),2) AS PCT
FROM pizza
GROUP BY pizza_size
order by pizza_size desc;

-- F. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- G. Top 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- H. Bottom 5 Pizzas by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Revenue 
LIMIT 5;

-- I. Top 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

-- J. Bottom 5 Pizzas by Quantity
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold 
LIMIT 5;

-- K. Top 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

-- L. Bottom 5 Pizzas by Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza
GROUP BY pizza_name
ORDER BY Total_Orders 
LIMIT 5;



