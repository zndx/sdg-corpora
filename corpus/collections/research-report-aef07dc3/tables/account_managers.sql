CREATE TABLE account_managers (
  id INTEGER NOT NULL,
  manager_id VARCHAR(44),
  employee_name VARCHAR(32),
  sales_target DECIMAL,
  crm_usage_level VARCHAR(32),
  compliance_status BOOLEAN,
  executive_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (executive_id) REFERENCES executives (id)
);
