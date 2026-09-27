SELECT 
    p.category AS "Kategória produktu",
    ROUND(AVG(o.discount), 2) AS "Priemerná hodnota zľavy"
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY "Priemerná hodnota zľavy" DESC;

