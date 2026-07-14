CREATE TABLE sale_quotations (
  id INTEGER NOT NULL,
  quotation_id INTEGER,
  issue_date DATE,
  expiry_date DATE,
  total_amount VARCHAR(32),
  status VARCHAR(32),
  description VARCHAR(32),
  prospective_customer_id INTEGER,
  sales_administrator_id INTEGER,
  sales_activity_record_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (prospective_customer_id) REFERENCES sale_prospective_customers (id),
  FOREIGN KEY (sales_administrator_id) REFERENCES sale_sales_administrators (id),
  FOREIGN KEY (sales_activity_record_id) REFERENCES sale_sales_activity_records (id)
);
