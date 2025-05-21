# InventaTrack – Smart Sales & Inventory Management System

## 📌 Project Objective
InventaTrack is a SQL-based system to manage and analyze product inventory, supplier relationships, and warehouse stock across multiple locations. It tracks sales and provides actionable insights through SQL analytics and BI dashboards.

## 🛠️ Tools Used
- MySQL (Database Engine)
- MySQL Workbench / DBeaver (SQL GUI)
- Power BI (Optional for dashboard)

## 📂 Folder Structure

- `schema/` – All SQL table creation scripts
- `data/` – Sample data insert scripts
- `queries/` – Analytics queries (monthly sales, stock alerts, etc.)
- `bi_dashboard/` – Power BI/Tableau dashboards (optional)
- `README.md` – This file

## 🧪 How to Run
1. Open MySQL Workbench or DBeaver.
2. Create a new database: `CREATE DATABASE inventa_track;`
3. Run `/schema/create_tables.sql`
4. Run `/data/insert_data.sql`
5. Run any SQL in `/queries/` to view insights.

## 📊 BI Integration (Optional)
Connect Power BI to MySQL to build dashboards from the `inventa_track` database.
