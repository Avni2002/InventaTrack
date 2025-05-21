USE inventa_track;

-- 1. Insert into Suppliers
INSERT INTO suppliers (supplier_name, contact_name, phone, email, address) VALUES
('Global Traders', 'Amit Mehra', '9876543210', 'amit@globaltraders.com', 'New Delhi, India'),
('Alpha Suppliers', 'Priya Shah', '9823012345', 'priya@alphasuppliers.com', 'Mumbai, India'),
('TechnoSource', 'John Mathew', '9123456780', 'john@technosource.com', 'Bangalore, India');

-- 2. Insert into Products
INSERT INTO products (product_name, category, unit_price, supplier_id, reorder_level) VALUES
('Wireless Mouse', 'Electronics', 450.00, 1, 30),
('USB Keyboard', 'Electronics', 600.00, 1, 20),
('LED Monitor 24"', 'Electronics', 7000.00, 2, 15),
('Office Chair', 'Furniture', 3500.00, 3, 10),
('Notebook A5', 'Stationery', 40.00, 2, 50);

-- 3. Insert into Warehouses
INSERT INTO warehouses (warehouse_name, region, address) VALUES
('North Depot', 'North', 'Delhi Warehouse Zone'),
('South Depot', 'South', 'Chennai Industrial Area'),
('West Depot', 'West', 'Mumbai Logistics Park');

-- 4. Insert into Stock
INSERT INTO stock (product_id, warehouse_id, quantity, last_updated) VALUES
(1, 1, 100, '2024-12-01'),
(1, 2, 50, '2024-12-02'),
(2, 1, 30, '2024-12-01'),
(2, 3, 60, '2024-12-03'),
(3, 2, 20, '2024-12-02'),
(4, 3, 5, '2024-12-04'),
(5, 1, 70, '2024-12-01');

-- 5. Insert into Sales
INSERT INTO sales (product_id, warehouse_id, quantity_sold, sale_date) VALUES
(1, 1, 20, '2024-12-05'),
(2, 1, 10, '2024-12-06'),
(3, 2, 5, '2024-12-06'),
(1, 2, 10, '2024-12-07'),
(4, 3, 3, '2024-12-08'),
(5, 1, 25, '2024-12-09'),
(2, 3, 15, '2024-12-09');
