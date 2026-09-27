SELECT 
    c.customer_name AS "Meno zákazníka",
    o.order_id AS "Identifikátor objednávky",
    o.sales AS "Hodnota predaja"
FROM customers c
FULL JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_name;
