WITH RECURSIVE date_range AS (
    SELECT 
        MIN(sale_date) AS start_date,
        MAX(sale_date) AS end_date
    FROM flourmills_sales
),
calendar AS (
    SELECT start_date AS sale_day
    FROM date_range
    UNION ALL
    SELECT (sale_day + INTERVAL '1 day')::date
    FROM calendar, date_range
    WHERE (sale_day + INTERVAL '1 day')::date <= (SELECT end_date FROM date_range)
)
SELECT sale_day
FROM calendar
ORDER BY sale_day ASC;
