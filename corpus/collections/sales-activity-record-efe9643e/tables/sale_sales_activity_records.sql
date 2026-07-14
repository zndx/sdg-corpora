CREATE TABLE sale_sales_activity_records (
  id INTEGER NOT NULL,
  activity_id VARCHAR(34),
  activity_date TIMESTAMP,
  activity_type VARCHAR(32),
  duration_minutes INTEGER,
  outcome VARCHAR(32),
  notes VARCHAR(32),
  sales_administrator_id INTEGER,
  prospective_customer_id INTEGER,
  sales_report_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (sales_administrator_id) REFERENCES sale_sales_administrators (id),
  FOREIGN KEY (prospective_customer_id) REFERENCES sale_prospective_customers (id),
  FOREIGN KEY (sales_report_id) REFERENCES sale_sales_reports (id)
);
