USE restaurant;

SELECT 
    p.product_name, p.id, p.price, op.product_price
FROM
    products AS p
        INNER JOIN
    orders_products AS op ON p.id = op.product_id
WHERE
    p.product_name = 'Wine';

UPDATE products 
SET 
    price = price + 1
WHERE
    id = 11;

SELECT 
    p.product_name, p.id, p.price, op.product_price
FROM
    products AS p
        INNER JOIN
    orders_products AS op ON p.id = op.product_id
WHERE
    p.product_name = 'Wine';