SELECT 
    o.order_id AS "Identifikátor objednávky",
    c.customer_name AS "Meno zákazníka",
    o.sales AS "Hodnota predaja"
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.sales > 500
ORDER BY o.sales DESC;
