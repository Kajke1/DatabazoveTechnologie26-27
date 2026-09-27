SELECT 
    c.customer_name AS "Meno zákazníka",
    SUM(o.sales) AS "Celková hodnota nákupov"
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.sales) > 2000
ORDER BY "Celková hodnota nákupov" DESC;
