CREATE TABLE sale_sales_administrators (
  id INTEGER NOT NULL,
  admin_id VARCHAR(44),
  full_name VARCHAR(36),
  department VARCHAR(32),
  office_location VARCHAR(32),
  weekly_hours INTEGER,
  salary_grade VARCHAR(32),
  marketing_manager_id INTEGER,
  quotation_id INTEGER,
  sales_report_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (marketing_manager_id) REFERENCES sale_marketing_managers (id),
  FOREIGN KEY (quotation_id) REFERENCES sale_quotations (id),
  FOREIGN KEY (sales_report_id) REFERENCES sale_sales_reports (id)
);
