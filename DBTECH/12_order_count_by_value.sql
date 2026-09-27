SELECT 
    c.region AS "Región",
    COUNT(CASE WHEN o.sales > 1000 THEN 1 END) AS "Počet high-value objednávok",
    COUNT(CASE WHEN o.sales <= 1000 THEN 1 END) AS "Počet low-value objednávok"
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region
ORDER BY c.region;
