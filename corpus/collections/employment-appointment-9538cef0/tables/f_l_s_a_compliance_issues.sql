CREATE TABLE f_l_s_a_compliance_issues (
  id INTEGER NOT NULL,
  issue_id VARCHAR(44),
  issue_description VARCHAR(32),
  discovery_date DATE,
  resolution_date DATE,
  affected_department VARCHAR(32),
  violation_type VARCHAR(32),
  severity_level INTEGER,
  municipal_employee_id INTEGER,
  municipal_official_id INTEGER,
  record_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (municipal_employee_id) REFERENCES municipal_employees (id),
  FOREIGN KEY (municipal_official_id) REFERENCES municipal_officials (id),
  FOREIGN KEY (record_id) REFERENCES payroll_records (record_id)
);
