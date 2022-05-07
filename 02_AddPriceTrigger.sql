USE Restaurant;

CREATE 
    TRIGGER  add_price
 BEFORE INSERT ON OrdersProducts FOR EACH ROW 
    SET NEW . ProductPrice = (SELECT 
            p.Price
        FROM
            Products AS p
        WHERE
            p.id = NEW.ProductId);


