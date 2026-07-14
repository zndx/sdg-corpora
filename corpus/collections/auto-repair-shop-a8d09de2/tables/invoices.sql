CREATE TABLE invoices (
  invoice_id VARCHAR(44) NOT NULL,
  issue_date DATE,
  total_amount VARCHAR(32),
  tax_amount VARCHAR(32),
  payment_status VARCHAR(32),
  due_date DATE,
  repair_job_id INTEGER,
  customer_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (invoice_id),
  FOREIGN KEY (repair_job_id) REFERENCES repair_jobs (id),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);
