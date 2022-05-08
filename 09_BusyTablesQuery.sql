/* List of busy/occupied tables */
USE restaurant;

SELECT 
    t.id AS table_number, os.status_name AS order_status
FROM
    restaurant_tables AS t
        INNER JOIN
    orders AS o ON t.id = o.order_table
        INNER JOIN
    order_statuses AS os ON o.order_status = os.id
WHERE
    o.order_status = 1;