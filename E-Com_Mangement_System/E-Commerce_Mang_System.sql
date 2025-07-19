CREATE DATABASE Ecom_Mange_S;
USE Ecom_Mange_S;

-- Customer Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

-- Categories Table
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);

-- Product Table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Order Table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order_items Table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    amount_paid DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Insert the data into customer Table 
INSERT INTO customers (name, email, phone, address)
VALUES ('Ram Kumar', 'ram@example.com', '9876543210', 'Chennai'),
('Anita Sharma', 'anita@gmail.com', '9876543211', 'Mumbai'),
('John Paul', 'johnp@gmail.com', '9876543212', 'Chennai'),
('Deepa Reddy', 'deepa@gmail.com', '9876543213', 'Hyderabad'),
('Ajay Singh', 'ajay@gmail.com', '9876543214', 'Bangalore'),
('Sara Khan', 'sara@gmail.com', '9876543215', 'Kolkata'),
('Raj Patel', 'raj@gmail.com', '9876543216', 'Ahmedabad');

-- Insert the data into categories Table 
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Fashion'),
('Books'),
('Home Appliances'),
('Toys'),
('Sports'),
('Furniture');

-- Insert the data into Product Table 
INSERT INTO products (product_name, price, stock, category_id) VALUES
('Smartphone', 15000.00, 10, 1),
('Jeans', 1200.00, 25, 2),
('Cookbook', 500.00, 15, 3),
('Microwave Oven', 7500.00, 5, 4),
('Action Figure', 899.00, 30, 5),
('Football', 699.00, 20, 6),
('Office Chair', 3200.00, 8, 7);

-- Insert the data into Order Table
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2025-07-01 10:30:00', 16500.00, 'Shipped'),
(2, '2025-07-02 14:00:00', 1700.00, 'Delivered'),
(3, '2025-07-03 16:20:00', 500.00, 'Pending'),
(4, '2025-07-04 09:00:00', 7500.00, 'Cancelled'),
(5, '2025-07-05 13:10:00', 899.00, 'Shipped'),
(6, '2025-07-06 11:45:00', 699.00, 'Delivered'),
(7, '2025-07-07 15:30:00', 3200.00, 'Processing');

-- Insert the data into order_items Table
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 15000.00),
(1, 3, 1, 500.00),
(2, 2, 1, 1200.00),
(2, 3, 1, 500.00),
(4, 4, 1, 7500.00),
(5, 5, 1, 899.00),
(6, 6, 1, 699.00);

-- Insert the data into Payments Table
INSERT INTO payments (order_id, payment_date, amount_paid, payment_method, payment_status) VALUES
(1, '2025-07-01 11:00:00', 16500.00, 'UPI', 'Paid'),
(2, '2025-07-02 14:15:00', 1700.00, 'Credit Card', 'Paid'),
(3, '2025-07-03 16:30:00', 500.00, 'Net Banking', 'Pending'),
(4, '2025-07-04 09:30:00', 7500.00, 'Cash', 'Failed'),
(5, '2025-07-05 13:30:00', 899.00, 'UPI', 'Paid'),
(6, '2025-07-06 12:00:00', 699.00, 'Debit Card', 'Paid'),
(7, '2025-07-07 16:00:00', 3200.00, 'Credit Card', 'Processing');

CREATE VIEW customer_order_summary AS
SELECT c.name, o.order_id, o.order_date, o.total_amount, p.payment_status
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id;

SELECT *  FROM customer_order_summary

DELIMITER //
CREATE TRIGGER reduce_stock AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE products SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END;
//
DELIMITER ;

SELECT * FROM products;

DROP PROCEDURE IF EXISTS daily_sales_report;
DELIMITER //
CREATE PROCEDURE daily_sales_report(IN report_date DATE)
BEGIN
    SELECT order_id, total_amount, status
    FROM orders
    WHERE DATE(order_date) = report_date;
END;
//
DELIMITER ;

CALL  daily_sales_report('2025-07-01');
 






