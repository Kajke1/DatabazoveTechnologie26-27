SELECT DISTINCT product_category
FROM flourmills_sales AS outer_table
WHERE EXISTS (
    SELECT product_category
    FROM flourmills_sales AS inner_table
    WHERE inner_table.product_category = outer_table.product_category
    GROUP BY product_category
    HAVING COUNT(DISTINCT region) > 3
);
