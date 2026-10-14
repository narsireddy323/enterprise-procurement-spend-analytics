# Enterprise Procurement & Spend Analytics Engine

##  Project Overview
This project simulates an enterprise **Source-to-Pay (S2P)** database environment. It leverages advanced SQL queries to analyze global supplier spending, execute Pareto (80/20) analyses, track month-over-month category variance, and audit high-risk vendor exposure.

## 🛠️ Tech Stack & Skills Demonstrated
* **Database Engine:** PostgreSQL
* **SQL Concepts:** Relational Database Design (3NF), Window Functions (`SUM() OVER`, `LAG`), CTEs, Conditional Aggregation, Table Constraints.

---

## 📁 Repository Structure
* `01_schema_setup.sql` - DDL statements creating normalized tables (`categories`, `suppliers`, `purchase_orders`).
* `02_seed_data.sql` - Realistic enterprise insert statements for testing.
* `03_analytical_queries.sql` - Advanced queries solving core procurement challenges:
  1. **Pareto Analysis:** Identifying core Tier 1 vendors driving 80% of corporate spend.
  2. **MoM Trends:** Tracking category-level budget growth over time.
  3. **Risk Audit:** Cross-referencing supplier risk scores with total capital exposure.

---

## 💡 Key Business Insights
* **Supplier Concentration:** Discovered that roughly 20% of active suppliers account for over 80% of total company expenditure, giving procurement teams leverage for volume negotiations.
* **Spend Variance:** Flagged sudden cost fluctuations across IT and Supply Chain business units month-over-month.
