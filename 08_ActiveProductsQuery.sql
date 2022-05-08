/* Products list - select all active products (paginated) */
USE Restaurant;

UPDATE Products 
SET 
    IsDeleted = 1
WHERE
    `Name` = 'Whisky' OR `Name` = 'Spinach';

SELECT 
    *
FROM
    Products
WHERE
    IsDeleted = 0
ORDER BY `Name`
LIMIT 0 , 5;

SELECT 
    *
FROM
    Products
WHERE
    IsDeleted = 0
ORDER BY `Name`
LIMIT 5 , 5;