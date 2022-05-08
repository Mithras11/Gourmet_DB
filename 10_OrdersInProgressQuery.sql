/* List orders in progress */
USE restaurant;

SELECT 
    p.product_name, os.status_name AS current_status
FROM
    orders AS o
        INNER JOIN
    orders_products AS op ON op.order_id = o.id
        INNER JOIN
    products AS p ON op.product_id = p.Id
        INNER JOIN
    order_statuses AS os ON o.order_status = os.id
WHERE
    o.order_status = 1;