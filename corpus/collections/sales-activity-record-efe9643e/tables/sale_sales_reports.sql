CREATE TABLE sale_sales_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  report_date DATE,
  total_calls INTEGER,
  new_prospects INTEGER,
  appointments_set INTEGER,
  status VARCHAR(32),
  sales_administrator_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (sales_administrator_id) REFERENCES sale_sales_administrators (id)
);
