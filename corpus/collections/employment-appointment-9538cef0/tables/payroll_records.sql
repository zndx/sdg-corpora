CREATE TABLE payroll_records (
  record_id INTEGER NOT NULL,
  pay_period_start DATE,
  pay_period_end DATE,
  employee_id VARCHAR(32),
  base_salary DECIMAL,
  overtime_hours DECIMAL,
  overtime_rate DECIMAL,
  total_gross_pay VARCHAR(32),
  compliance_status VARCHAR(32),
  municipal_employee_id INTEGER,
  audited_by_municipal_employee_id INTEGER,
  PRIMARY KEY (record_id),
  FOREIGN KEY (municipal_employee_id) REFERENCES municipal_employees (id),
  FOREIGN KEY (audited_by_municipal_employee_id) REFERENCES municipal_employees (id)
);
