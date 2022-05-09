/* List orders per period (start date and time, end date time) - result should contain order total and date */
CREATE PROCEDURE  get_list_of_orders_per_period (IN selected_start_date DATETIME, selcted_end_date DATETIME)
	SELECT o.id AS order_id,
		FORMAT(SUM(op.product_price * op.product_quantity), 'N2') AS total_amount,
        CONVERT(o.end_date, DATE) AS order_date
	FROM orders AS o
	INNER JOIN orders_products AS op
		ON o.id = op.order_id
	INNER JOIN products AS p
		ON op.product_id = p.id
	WHERE o.create_date >= selected_start_date  -- only lists orders made in february and march
		AND o.end_date <= selcted_end_date     -- that are completed (e.g. order 1 is marked in progress therefore is missing here)
	GROUP BY o.id, o.end_date;
