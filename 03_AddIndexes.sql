USE restaurant;

CREATE INDEX product_name_idx
ON products (product_name);

CREATE INDEX product_price_idx
ON orders_products (product_price);

CREATE INDEX order_create_date_idx
ON orders (create_date);

CREATE INDEX order_end_date_idx
ON orders (end_date);