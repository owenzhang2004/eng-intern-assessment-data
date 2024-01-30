-- Problem 1: Retrieve all products in the Sports category
-- Write an SQL query to retrieve all products in a specific category.
SELECT *
FROM Products
WHERE category_id IN (
    SELECT category_id
    FROM categories
    WHERE category_name LIKE '%Sports%'
);

-- Problem 2: Retrieve the total number of orders for each user
-- Write an SQL query to retrieve the total number of orders for each user.
-- The result should include the user ID, username, and the total number of orders.

SELECT u.user_id, u.username, o.total_amount 
FROM Users AS u 
JOIN Orders AS o ON u.user_id = o.user_id;

-- Problem 3: Retrieve the average rating for each product
-- Write an SQL query to retrieve the average rating for each product.
-- The result should include the product ID, product name, and the average rating.

SELECT p.product_id, p.product_name, CAST(AVG(r.rating) AS DECIMAL (10, 2)) AS average_rating
FROM Products AS p 
JOIN Reviews AS r ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name;


-- Problem 4: Retrieve the top 5 users with the highest total amount spent on orders
-- Write an SQL query to retrieve the top 5 users with the highest total amount spent on orders.
-- The result should include the user ID, username, and the total amount spent.

SELECT u.user_id, u.username, SUM(o.total_amount) AS total_amount_sent
FROM Users AS u
JOIN Orders AS o ON u.user_id = o.user_id
GROUP BY u.user_id, u.username
ORDER BY SUM(o.total_amount) DESC
LIMIT 5;