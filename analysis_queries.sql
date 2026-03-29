-- Food Delivery Analysis Queries

-- Query 1: Top 5 restaurants by number of orders

SELECT restaurants.name,
COUNT(orders.order_id) AS total_orders
FROM restaurants
INNER JOIN orders ON restaurants.restaurant_id = orders.restaurant_id
GROUP BY restaurants.name
ORDER BY total_orders DESC
LIMIT 5;

-- Query 2: Total revenue by city

SELECT restaurants.city,
SUM(orders.total_amount) AS total_revenue
FROM restaurants
INNER JOIN orders ON restaurants.restaurant_id = orders.restaurant_id
GROUP BY restaurants.city
ORDER BY total_revenue DESC;

-- Query 3: Cancellation analysis by restaurant

SELECT restaurants.name,
COUNT(orders.order_id) AS cancelled_orders
FROM restaurants
INNER JOIN orders ON restaurants.restaurant_id = orders.restaurant_id
WHERE orders.status = 'cancelled'
GROUP BY restaurants.name
ORDER BY cancelled_orders DESC;

-- Query 4: Average order value per restaurant

SELECT restaurants.name,
AVG(orders.total_amount) AS average_order_value
FROM restaurants
INNER JOIN orders ON restaurants.restaurant_id = orders.restaurant_id
GROUP BY restaurants.name
ORDER BY average_order_value DESC;

-- Query 5: Repeat customers (ordered more than once)

SELECT customers.name,
COUNT(orders.order_id) AS total_orders
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.name
HAVING COUNT(orders.order_id) > 1
ORDER BY total_orders DESC;

-- Query 6: Peak order hours

SELECT HOUR(orders.order_time) AS hour,
COUNT(orders.order_id) AS total_orders
FROM orders
GROUP BY hour
ORDER BY total_orders DESC
LIMIT 5;