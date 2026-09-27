SELECT 
    p.product_name AS "Názov produktu",
    COALESCE(SUM(o.sales), 0) AS "Celková hodnota predaja"
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY "Celková hodnota predaja" DESC;
