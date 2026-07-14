CREATE TABLE investor_relations_directors (
  director_id INTEGER NOT NULL,
  appointment_year INTEGER,
  reporting_period VARCHAR(32),
  compliance_status VARCHAR(32),
  company_id VARCHAR(32),
  shareholder_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (director_id),
  FOREIGN KEY (company_id) REFERENCES companies (company_id),
  FOREIGN KEY (shareholder_id) REFERENCES shareholders (id)
);
