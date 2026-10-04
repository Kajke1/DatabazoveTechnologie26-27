SELECT DISTINCT product_category
FROM flourmills_sales AS outer_table
WHERE NOT EXISTS (
    SELECT 1
    FROM flourmills_sales AS inner_table
    WHERE inner_table.product_category = outer_table.product_category
    AND inner_table.total_amount > 500000
);
