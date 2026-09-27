SELECT 
    c.region AS "Región",
    COALESCE(SUM(o.sales), 0) AS "Celková hodnota predaja"
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY "Celková hodnota predaja" DESC;

