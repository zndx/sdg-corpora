CREATE TABLE compliance_coordinators (
  id INTEGER NOT NULL,
  employee_id VARCHAR(32),
  full_name VARCHAR(36),
  department VARCHAR(32),
  contact_email VARCHAR(32),
  last_audit_date DATE,
  head_coach_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (head_coach_id) REFERENCES head_coaches (id)
);
