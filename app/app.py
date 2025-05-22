from flask import Flask, render_template
import os, sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from db.db_config import get_connection

app = Flask(__name__)

@app.route('/')
def dashboard():
    conn   = get_connection()
    cursor = conn.cursor(dictionary=True)

    # ── 1. Monthly sales revenue ────────────────────────────────────────────
    cursor.execute("""
        SELECT DATE_FORMAT(s.sale_date,'%Y-%m') AS month,
               SUM(s.quantity_sold * p.unit_price) AS revenue
        FROM sales s
        JOIN products p ON s.product_id = p.product_id
        GROUP BY month
        ORDER BY month
    """)
    sales_data = cursor.fetchall()
    months  = [row['month']            for row in sales_data]
    revenue = [float(row['revenue'])   for row in sales_data]

    # ── 2. Low-stock items ──────────────────────────────────────────────────
    cursor.execute("""
        SELECT p.product_name,
               w.warehouse_name,
               s.quantity                AS current_stock,
               p.reorder_level
        FROM stock s
        JOIN products   p ON s.product_id   = p.product_id
        JOIN warehouses w ON s.warehouse_id = w.warehouse_id
        WHERE s.quantity <= p.reorder_level
        ORDER BY current_stock ASC
    """)
    low_stock_data = cursor.fetchall()

    # ── 3. Reorder suggestions ─────────────────────────────────────────────
    safety_buffer = 5
    cursor.execute("""
        SELECT p.product_name,
               w.warehouse_name,
               s.quantity                            AS current_stock,
               p.reorder_level,
               (p.reorder_level - s.quantity + %s)   AS reorder_quantity
        FROM stock s
        JOIN products   p ON s.product_id   = p.product_id
        JOIN warehouses w ON s.warehouse_id = w.warehouse_id
        WHERE s.quantity <= p.reorder_level
    """, (safety_buffer,))
    reorder_data = cursor.fetchall()

    # ── 4. Regional sales revenue ──────────────────────────────────────────
    cursor.execute("""
        SELECT w.region,
               SUM(s.quantity_sold * p.unit_price) AS revenue
        FROM sales s
        JOIN products   p ON s.product_id   = p.product_id
        JOIN warehouses w ON s.warehouse_id = w.warehouse_id
        GROUP BY w.region
    """)
    region_sales   = cursor.fetchall()
    region_labels  = [row['region']          for row in region_sales]
    region_revenue = [float(row['revenue'])  for row in region_sales]

    cursor.close()
    conn.close()

    # ── 5. ONE final return ────────────────────────────────────────────────
    return render_template(
        "dashboard.html",
        months          = months,
        revenue         = revenue,
        low_stock       = low_stock_data,
        reorder_data    = reorder_data,
        region_labels   = region_labels,
        region_revenue  = region_revenue
    )

if __name__ == "__main__":
    app.run(debug=True)
