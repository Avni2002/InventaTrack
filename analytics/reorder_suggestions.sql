USE inventa_track;

SELECT 
    p.product_name,
    w.warehouse_name,
    s.quantity AS current_stock,
    p.reorder_level,
    (p.reorder_level * 2 - s.quantity) AS suggested_reorder_qty
FROM stock s
JOIN products p ON s.product_id = p.product_id
JOIN warehouses w ON s.warehouse_id = w.warehouse_id
WHERE s.quantity < p.reorder_level;
