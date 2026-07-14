CREATE TABLE financial_staffs (
  id INTEGER NOT NULL,
  staff_id INTEGER,
  full_name VARCHAR(36),
  role VARCHAR(32),
  employment_status VARCHAR(32),
  hire_date DATE,
  supervisor_staff_id VARCHAR(44),
  financial_report_id INTEGER,
  financial_staff_id INTEGER,
  department_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (financial_report_id) REFERENCES financial_reports (id),
  FOREIGN KEY (financial_staff_id) REFERENCES financial_staffs (id),
  FOREIGN KEY (department_id) REFERENCES departments (department_id)
);
