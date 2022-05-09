/* List sold products for a given month -
result should show aggregated quantity and aggregated price for all sales during the search period. 
Every matching product should exist once into the result. */

CREATE PROCEDURE  get_sold_products_for_given_month(IN selected_month INT)
	SELECT  p.product_name,
		FORMAT(SUM(op.product_price * op.product_quantity), 'N2') AS total_price,
		op.product_price AS individual_price,
		op.product_quantity,
        	MONTH(o.end_date) AS given_month
	FROM orders AS o
	INNER JOIN orders_products AS op
		ON o.id = op.order_id
	INNER JOIN products AS p
		ON op.product_id = p.id
	WHERE MONTH(o.end_date) = selected_month  -- only lists orders made in february that are completed
						  -- (e.g. order 1 is marked in progress therefore is missing here)
	GROUP BY p.product_name, op.product_price, op.product_quantity, o.end_date
	ORDER BY p.product_name;
