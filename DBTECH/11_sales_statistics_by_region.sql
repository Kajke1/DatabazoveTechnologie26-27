SELECT 
    c.region AS "Región",
    SUM(o.sales) AS "Celková hodnota predaja",
    ROUND(AVG(o.discount), 2) AS "Priemerná hodnota zľavy",
    COUNT(o.order_id) AS "Počet objednávok"
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY "Celková hodnota predaja" DESC;
