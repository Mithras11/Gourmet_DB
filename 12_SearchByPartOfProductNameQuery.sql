/* Search by part of product name - select all matching products */
USE restaurant;

SELECT 
    product_name
FROM
    products
WHERE
    product_name LIKE '%ke%'
ORDER BY product_name;