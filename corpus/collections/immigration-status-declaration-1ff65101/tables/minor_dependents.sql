CREATE TABLE minor_dependents (
  minor_dependent_id INTEGER NOT NULL,
  minor_id VARCHAR(32),
  full_name VARCHAR(36),
  age INTEGER,
  citizenship_status VARCHAR(32),
  immigration_status_declaration_id INTEGER,
  leasing_officer_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (minor_dependent_id),
  FOREIGN KEY (immigration_status_declaration_id) REFERENCES immigration_status_declarations (id),
  FOREIGN KEY (leasing_officer_id) REFERENCES leasing_officers (leasing_officer_id)
);
