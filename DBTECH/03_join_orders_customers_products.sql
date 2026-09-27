SELECT 
    o.order_id AS "Identifikátor objednávky",
    c.customer_name AS "Meno zákazníka",
    p.category AS "Kategória produktu",
    o.sales AS "Hodnota predaja"
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;
