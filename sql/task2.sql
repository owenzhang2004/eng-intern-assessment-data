-- Problem 5: Retrieve the products with the highest average rating
-- Write an SQL query to retrieve the products with the highest average rating.
-- The result should include the product ID, product name, and the average rating.
-- Hint: You may need to use subqueries or common table expressions (CTEs) to solve this problem.

WITH user_ratings(product_id, product_name, average_rating) AS (
    SELECT p.product_id, p.product_name, CAST(AVG(r.rating) AS DECIMAL (10, 2)) AS average_rating
    FROM Products AS p 
    JOIN Reviews AS r ON p.product_id = r.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT * FROM user_ratings
ORDER BY average_rating DESC
LIMIT 5;

-- Problem 6: Retrieve the users who have made at least one order in each category
-- Write an SQL query to retrieve the users who have made at least one order in each category.
-- The result should include the user ID and username.
-- Hint: You may need to use subqueries or joins to solve this problem.

SELECT DISTINCT u.user_id, u.username
FROM Users AS u
JOIN Reviews AS r ON u.user_id = r.user_id
JOIN Products AS p ON p.product_id = r.product_id
JOIN Categories AS c ON c.category_id = p.category_id
WHERE u.user_id IN (
    SELECT u1.user_id
    FROM Users AS u1
    JOIN Reviews AS r1 ON u1.user_id = r1.user_id
    JOIN Products AS p1 ON p1.product_id = r1.product_id
    JOIN Categories AS c1 ON c1.category_id = p1.category_id
    GROUP BY u1.user_id, c1.category_id
    HAVING COUNT(DISTINCT c1.category_id) = (
        SELECT COUNT(DISTINCT category_id)
        FROM Categories
    )
);

-- Problem 7: Retrieve the products that have not received any reviews
-- Write an SQL query to retrieve the products that have not received any reviews.
-- The result should include the product ID and product name.
-- Hint: You may need to use subqueries or left joins to solve this problem.

SELECT p.product_id, p.product_name
FROM Products AS p
LEFT JOIN Reviews AS r ON r.product_id = p.product_id
WHERE r.product_id IS NULL;

-- Problem 8: Retrieve the users who have made consecutive orders on consecutive days
-- Write an SQL query to retrieve the users who have made consecutive orders on consecutive days.
-- The result should include the user ID and username.
-- Hint: You may need to use subqueries or window functions to solve this problem.

-- Incomplete, out of time
WITH prev AS (
    SELECT user_id, order_date, LAG(order_date) OVER (ORDER BY order_date) AS prev_order_date
    FROM Orders
)
SELECT user_id, order_date,
    EXTRACT(day FROM order_date - prev_order_date) AS diff
FROM prev;