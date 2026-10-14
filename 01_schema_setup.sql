-- Drop tables if they already exist (for clean re-runs)
DROP TABLE IF EXISTS purchase_orders;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS categories;

-- 1. Categories Table (Procurement hierarchy)
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    parent_category VARCHAR(100) NOT NULL
);

-- 2. Suppliers Table (Vendor master data)
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    country VARCHAR(50),
    risk_score INT, -- Scale of 1-100
    diversity_status VARCHAR(50) -- e.g., 'Minority-Owned', 'Standard'
);

-- 3. Purchase Orders Table (Core S2P transaction log)
CREATE TABLE purchase_orders (
    po_id SERIAL PRIMARY KEY,
    supplier_id INT REFERENCES suppliers(supplier_id),
    category_id INT REFERENCES categories(category_id),
    business_unit VARCHAR(100) NOT NULL,
    order_date DATE NOT NULL,
    spend_amount NUMERIC(12, 2) NOT NULL,
    payment_status VARCHAR(50) NOT NULL -- 'Paid', 'Pending', 'Disputed'
);