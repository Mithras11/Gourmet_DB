/* Select order details by order number - result should contain total price, waiter, date and time */
USE restaurant;

SELECT 
    o.id AS order_number,
    FORMAT(SUM(op.product_price * op.product_quantity),
        'N2') AS total_price,
    CONCAT(u.first_name, ' ', u.last_name) AS waiter,
    o.create_date
FROM
    orders AS o
        INNER JOIN
    orders_products AS op ON o.id = op.order_id
        INNER JOIN
    products AS p ON p.id = op.product_id
        INNER JOIN
    users AS u ON o.waiter = u.id
GROUP BY o.id , u.first_name , u.last_name
HAVING o.id = 2;