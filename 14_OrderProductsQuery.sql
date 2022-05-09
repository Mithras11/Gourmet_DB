/* List of order products by order number - result should contain name, code, price 
	e.g. All products for Order with id = 1 */
USE restaurant;

SELECT 
    o.id AS order_number,
    os.status_name AS order_status,
    p.product_name,
    op.product_price
FROM
    orders AS o
        INNER JOIN
    order_statuses AS os ON o.order_status = os.id
        INNER JOIN
    orders_products AS op ON o.id = op.order_id
        INNER JOIN
    products AS p ON op.product_id = p.id
WHERE
    o.id = 1;