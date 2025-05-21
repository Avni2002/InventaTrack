USE inventa_track;

SELECT 
    w.region,
    p.product_name,
    SUM(s.quantity_sold) AS quantity_sold,
    SUM(s.quantity_sold * p.unit_price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN warehouses w ON s.warehouse_id = w.warehouse_id
GROUP BY w.region, p.product_name
ORDER BY w.region, total_revenue DESC;
