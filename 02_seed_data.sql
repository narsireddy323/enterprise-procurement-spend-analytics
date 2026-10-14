-- 1. Insert Categories (Procurement hierarchy)
INSERT INTO categories (category_id, category_name, parent_category) VALUES
(1, 'Cloud Infrastructure (AWS/Azure)', 'Information Technology'),
(2, 'Office Software Licenses', 'Information Technology'),
(3, 'Corporate Travel & Hotels', 'Operations'),
(4, 'Logistics & Freight', 'Supply Chain'),
(5, 'Office Supplies', 'Administration'),
(6, 'Marketing & Advertising', 'Marketing'),
(7, 'Legal & Consulting Services', 'Professional Services');

-- 2. Insert Suppliers (Vendor master data with risk scores & diversity)
INSERT INTO suppliers (supplier_id, supplier_name, country, risk_score, diversity_status) VALUES
(101, 'Amazon Web Services', 'USA', 10, 'Standard'),
(102, 'Microsoft Corp', 'USA', 12, 'Standard'),
(103, 'Global Freight Express', 'Germany', 45, 'Standard'),
(104, 'Delta Air Lines', 'USA', 20, 'Standard'),
(105, 'Staples Business Advantage', 'USA', 15, 'Minority-Owned'),
(106, 'Salesforce Inc.', 'USA', 18, 'Standard'),
(107, 'Local Courier Services', 'India', 65, 'Minority-Owned'),
(108, 'Apex Legal Partners', 'UK', 25, 'Standard'),
(109, 'OmniMedia Ad Agency', 'USA', 30, 'Women-Owned'),
(110, 'SwiftTech Hardware', 'Taiwan', 50, 'Standard');

-- 3. Insert Expanded Purchase Orders (Simulating a full year of enterprise transactions)
INSERT INTO purchase_orders (supplier_id, category_id, business_unit, order_date, spend_amount, payment_status) VALUES
-- January Transactions
(101, 1, 'Engineering', '2025-01-05', 150000.00, 'Paid'),
(102, 2, 'IT', '2025-01-08', 95000.00, 'Paid'),
(103, 4, 'Supply Chain', '2025-01-10', 210000.00, 'Paid'),
(105, 5, 'Administration', '2025-01-12', 4500.00, 'Paid'),
(109, 6, 'Marketing', '2025-01-15', 85000.00, 'Paid'),
(104, 3, 'Human Resources', '2025-01-18', 12000.00, 'Paid'),
(108, 7, 'Legal', '2025-01-20', 45000.00, 'Paid'),
(101, 1, 'Engineering', '2025-01-25', 160000.00, 'Paid'),
(107, 4, 'Supply Chain', '2025-01-28', 9200.00, 'Paid'),

-- February Transactions
(101, 1, 'Engineering', '2025-02-02', 175000.00, 'Paid'),
(102, 2, 'IT', '2025-02-05', 30000.00, 'Paid'),
(103, 4, 'Supply Chain', '2025-02-08', 230000.00, 'Paid'),
(110, 1, 'Engineering', '2025-02-10', 115000.00, 'Paid'),
(105, 5, 'Administration', '2025-02-14', 6100.00, 'Paid'),
(106, 2, 'Sales', '2025-02-18', 40000.00, 'Paid'),
(109, 6, 'Marketing', '2025-02-22', 90000.00, 'Paid'),
(104, 3, 'Human Resources', '2025-02-25', 15400.00, 'Paid'),

-- March Transactions
(101, 1, 'Engineering', '2025-03-01', 180000.00, 'Paid'),
(102, 2, 'IT', '2025-03-03', 105000.00, 'Paid'),
(103, 4, 'Supply Chain', '2025-03-06', 195000.00, 'Paid'),
(106, 2, 'Sales', '2025-03-10', 60000.00, 'Pending'),
(105, 5, 'Administration', '2025-03-12', 3200.00, 'Paid'),
(108, 7, 'Legal', '2025-03-15', 50000.00, 'Paid'),
(110, 1, 'Engineering', '2025-03-18', 125000.00, 'Paid'),
(107, 4, 'Supply Chain', '2025-03-22', 8500.00, 'Disputed'),
(109, 6, 'Marketing', '2025-03-28', 110000.00, 'Paid'),

-- April Transactions
(101, 1, 'Engineering', '2025-04-02', 190000.00, 'Paid'),
(103, 4, 'Supply Chain', '2025-04-05', 240000.00, 'Paid'),
(102, 2, 'IT', '2025-04-09', 95000.00, 'Paid'),
(105, 5, 'Administration', '2025-04-12', 5400.00, 'Paid'),
(104, 3, 'Human Resources', '2025-04-16', 18200.00, 'Paid'),
(106, 2, 'Sales', '2025-04-20', 45000.00, 'Paid'),
(110, 1, 'Engineering', '2025-04-25', 130000.00, 'Paid');
