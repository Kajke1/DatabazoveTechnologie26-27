SELECT 
    product_name,
    product_category,
    total_amount
FROM flourmills_sales AS outer_table
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM flourmills_sales AS inner_table
    WHERE inner_table.product_category = outer_table.product_category
);
