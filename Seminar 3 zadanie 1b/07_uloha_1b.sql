WITH RECURSIVE monthly_revenue AS (
    SELECT 
        DATE_TRUNC('month', sale_date) AS month,
        SUM(total_amount) AS revenue
    FROM flourmills_sales
    GROUP BY DATE_TRUNC('month', sale_date)
    ORDER BY month
),
ordered_months AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY month) AS rn,
        month,
        revenue
    FROM monthly_revenue
),
cumulative_target AS (
    SELECT 
        rn,
        month,
        revenue,
        revenue AS cumulative_revenue
    FROM ordered_months
    WHERE rn = 1

    UNION ALL

    SELECT 
        next.rn,
        next.month,
        next.revenue,
        prev.cumulative_revenue + next.revenue AS cumulative_revenue
    FROM cumulative_target AS prev
    JOIN ordered_months AS next
        ON next.rn = prev.rn + 1
    WHERE prev.cumulative_revenue < 500000000
)
SELECT 
    month,
    cumulative_revenue
FROM cumulative_target
ORDER BY rn DESC
LIMIT 1;
