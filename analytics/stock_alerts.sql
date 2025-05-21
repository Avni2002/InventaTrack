USE inventa_track;

SELECT 
    p.product_name,
    w.warehouse_name,
    s.quantity,
    p.reorder_level
FROM stock s
JOIN products p ON s.product_id = p.product_id
JOIN warehouses w ON s.warehouse_id = w.warehouse_id
WHERE s.quantity < p.reorder_level
ORDER BY p.product_name;
