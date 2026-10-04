SELECT product_name
FROM flourmills_sales
GROUP BY product_name
HAVING COUNT(DISTINCT EXTRACT(MONTH FROM sale_date)) > 1;
