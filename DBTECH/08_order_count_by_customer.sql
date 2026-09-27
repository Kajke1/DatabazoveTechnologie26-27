SELECT 
    c.customer_name AS "Meno zákazníka",
    COUNT(o.order_id) AS "Počet objednávok"
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY "Počet objednávok" DESC;
