USE restaurant;

CREATE 
    TRIGGER  add_price
 BEFORE INSERT ON orders_products FOR EACH ROW 
    SET NEW . product_price = (SELECT 
            p.price
        FROM
            products AS p
        WHERE
            p.id = NEW.product_id);
