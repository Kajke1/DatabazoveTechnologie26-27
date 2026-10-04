SELECT region, product_name, total_amount, sale_date
FROM flourmills_sales AS outer_table
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales AS inner_table
    WHERE inner_table.region = outer_table.region
    AND EXTRACT(YEAR FROM inner_table.sale_date) = 2024
);
