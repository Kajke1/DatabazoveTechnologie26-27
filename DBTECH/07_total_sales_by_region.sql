SELECT 
    c.region AS "Región",
    SUM(o.sales) AS "Celková hodnota predaja"
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY "Celková hodnota predaja" DESC;
