-- Food Delivery Database
-- Create Tables

--CUSTOMERS TABLE

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    phone VARCHAR(15),
    joined_date DATE
);
-- RESTAURANTS TABLE

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    cuisine_type VARCHAR(50),
    rating DECIMAL(2,1)
);
-- ORDERS TABLE

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_time DATETIME,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
--PAYMENTS TABLE

CREATE TABLE payments (
    pay_id INT PRIMARY KEY,
    order_id INT,
    method VARCHAR(20),
    status VARCHAR(20),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);