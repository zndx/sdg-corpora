CREATE TABLE leasing_officers (
  leasing_officer_id INTEGER NOT NULL,
  officer_id INTEGER,
  full_name VARCHAR(36),
  employee_id VARCHAR(32),
  department VARCHAR(32),
  immigration_status_declaration_id INTEGER,
  minor_dependent_id INTEGER,
  PRIMARY KEY (leasing_officer_id),
  FOREIGN KEY (immigration_status_declaration_id) REFERENCES immigration_status_declarations (id),
  FOREIGN KEY (minor_dependent_id) REFERENCES minor_dependents (minor_dependent_id)
);
