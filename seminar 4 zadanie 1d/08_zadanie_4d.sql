WITH first_purchase AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(order_date))::date AS first_month
    FROM orders
    GROUP BY customer_id
),
returned_customers AS (
    SELECT
        fp.customer_id
    FROM first_purchase fp
    WHERE fp.first_month = DATE '2024-06-01'
      AND EXISTS (
            SELECT 1
            FROM orders o
            WHERE o.customer_id = fp.customer_id
              AND DATE_TRUNC('month', o.order_date)::date > fp.first_month
        )
)
SELECT COUNT(*) FROM returned_customers;
