USE inventa_track;

SELECT 
    p.product_name,
    DATE_FORMAT(s.sale_date, '%Y-%m') AS month,
    SUM(s.quantity_sold) AS total_quantity_sold,
    SUM(s.quantity_sold * p.unit_price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name, month
ORDER BY month, total_revenue DESC;
