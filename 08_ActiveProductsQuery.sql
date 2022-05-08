/* Products list - select all active products (paginated) */
USE restaurant;

UPDATE products 
SET 
    is_deleted = 1
WHERE
    product_name = 'Whisky' OR product_name = 'Spinach';

SELECT 
    *
FROM
    products
WHERE
    is_deleted = 0
ORDER BY product_name
LIMIT 0, 5;

SELECT 
    *
FROM
    products
WHERE
    is_deleted = 0
ORDER BY product_name
LIMIT 5, 5;