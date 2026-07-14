CREATE TABLE municipal_officials (
  id INTEGER NOT NULL,
  official_id VARCHAR(42),
  full_name VARCHAR(36),
  office_title VARCHAR(32),
  term_start_date DATE,
  term_end_date DATE,
  party_affiliation VARCHAR(32),
  contact_email VARCHAR(32),
  municipal_employee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (municipal_employee_id) REFERENCES municipal_employees (id)
);
