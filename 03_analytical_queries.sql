-- Query 1: Pareto Analysis (The 80/20 Supplier Spend Rule)
WITH supplier_spend AS (
    SELECT 
        s.supplier_id,
        s.supplier_name,
        SUM(po.spend_amount) AS total_spend
    FROM purchase_orders po
    JOIN suppliers s ON po.supplier_id = s.supplier_id
    WHERE po.payment_status = 'Paid'
    GROUP BY s.supplier_id, s.supplier_name
),
running_totals AS (
    SELECT 
        supplier_name,
        total_spend,
        SUM(total_spend) OVER (ORDER BY total_spend DESC) AS running_total,
        SUM(total_spend) OVER () AS grand_total
    FROM supplier_spend
)
SELECT 
    supplier_name,
    total_spend,
    ROUND((running_total / grand_total) * 100, 2) AS cumulative_percentage,
    CASE 
        WHEN (running_total - total_spend) / grand_total <= 0.80 THEN 'Tier 1 (Core Vendor)'
        ELSE 'Tier 2 (Tail Spend)'
    END AS vendor_classification
FROM running_totals
ORDER BY total_spend DESC;

-- Query 2: Month-over-Month (MoM) Spend Trend & Growth Rate
WITH monthly_category_spend AS (
    SELECT 
        c.parent_category,
        DATE_TRUNC('month', po.order_date) AS spend_month,
        SUM(po.spend_amount) AS monthly_spend
    FROM purchase_orders po
    JOIN categories c ON po.category_id = c.category_id
    GROUP BY c.parent_category, DATE_TRUNC('month', po.order_date)
)
SELECT 
    parent_category,
    spend_month,
    monthly_spend,
    LAG(monthly_spend, 1) OVER (PARTITION BY parent_category ORDER BY spend_month) AS previous_month_spend,
    ROUND(
        (monthly_spend - LAG(monthly_spend, 1) OVER (PARTITION BY parent_category ORDER BY spend_month)) 
        / NULLIF(LAG(monthly_spend, 1) OVER (PARTITION BY parent_category ORDER BY spend_month), 0) * 100, 2
    ) AS mom_growth_percentage
FROM monthly_category_spend;

-- Query 3: Supplier Risk & Spend Exposure Audit
SELECT 
    s.supplier_name,
    s.country,
    s.risk_score,
    s.diversity_status,
    COUNT(po.po_id) AS total_purchase_orders,
    SUM(po.spend_amount) AS total_exposure
FROM suppliers s
LEFT JOIN purchase_orders po ON s.supplier_id = po.supplier_id
GROUP BY s.supplier_id, s.supplier_name, s.country, s.risk_score, s.diversity_status
HAVING s.risk_score > 40 OR SUM(po.spend_amount) > 50000
ORDER BY total_exposure DESC;