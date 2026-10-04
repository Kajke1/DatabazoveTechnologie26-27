SELECT DISTINCT region
FROM flourmills_sales AS outer_table
WHERE NOT EXISTS (
    SELECT 1
    FROM flourmills_sales AS inner_table
    WHERE inner_table.region = outer_table.region
    AND inner_table.product_category = 'Flour'
);
