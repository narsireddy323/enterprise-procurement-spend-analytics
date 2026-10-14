-- Insert Categories
INSERT INTO categories (category_id, category_name, parent_category) VALUES
(1, 'Cloud Infrastructure (AWS/Azure)', 'Information Technology'),
(2, 'Office Software Licenses', 'Information Technology'),
(3, 'Corporate Travel & Hotels', 'Operations'),
(4, 'Logistics & Freight', 'Supply Chain'),
(5, 'Office Supplies', 'Administration');

-- Insert Suppliers
INSERT INTO suppliers (supplier_id, supplier_name, country, risk_score, diversity_status) VALUES
(101, 'Amazon Web Services', 'USA', 10, 'Standard'),
(102, 'Microsoft Corp', 'USA', 12, 'Standard'),
(103, 'Global Freight Express', 'Germany', 45, 'Standard'),
(104, 'Delta Air Lines', 'USA', 20, 'Standard'),
(105, 'Staples Business Advantage', 'USA', 15, 'Minority-Owned'),
(106, 'Salesforce Inc.', 'USA', 18, 'Standard'),
(107, 'Local Courier Services', 'India', 65, 'Minority-Owned');

-- Insert Purchase Orders (Simulating enterprise spend transactions)
INSERT INTO purchase_orders (supplier_id, category_id, business_unit, order_date, spend_amount, payment_status) VALUES
(101, 1, 'Engineering', '2025-01-10', 150000.00, 'Paid'),
(101, 1, 'Engineering', '2025-02-12', 175000.00, 'Paid'),
(102, 2, 'IT', '2025-01-15', 90000.00, 'Paid'),
(103, 4, 'Supply Chain', '2025-01-20', 220000.00, 'Paid'),
(104, 3, 'Human Resources', '2025-02-01', 12000.00, 'Paid'),
(105, 5, 'Administration', '2025-02-05', 4500.00, 'Paid'),
(101, 1, 'Engineering', '2025-03-01', 180000.00, 'Paid'),
(106, 2, 'Sales', '2025-03-04', 60000.00, 'Pending'),
(103, 4, 'Supply Chain', '2025-03-10', 210000.00, 'Paid'),
(105, 5, 'Administration', '2025-03-15', 3200.00, 'Paid'),
(107, 4, 'Supply Chain', '2025-03-20', 8500.00, 'Disputed');