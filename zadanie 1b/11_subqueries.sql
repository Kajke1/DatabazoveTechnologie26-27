SELECT product_category, product_name, total_amount
FROM flourmills_sales AS outer_table
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS inner_table
    WHERE inner_table.product_category = outer_table.product_category
    AND inner_table.total_amount > 200000
);
