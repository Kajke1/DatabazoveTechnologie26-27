SELECT 
    c.customer_name AS "Meno zákazníka",
    SUM(o.sales) AS "Celkový predaj",
    ROUND(AVG(o.discount), 2) AS "Priemerná zľava",
    COUNT(o.order_id) AS "Počet objednávok",
    CASE 
        WHEN SUM(o.sales) > 2500 THEN 'VIP'
        ELSE 'REGULAR'
    END AS "Typ zákazníka"
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY "Celkový predaj" DESC;
