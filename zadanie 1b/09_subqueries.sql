SELECT 
    product_name,
    region,
    total_amount,
    (SELECT MIN(total_amount)
     FROM flourmills_sales AS inner_table
     WHERE inner_table.region = outer_table.region) AS region_min_amount
FROM flourmills_sales AS outer_table;
