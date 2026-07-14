CREATE TABLE tax_regulations (
  tax_regulation_id INTEGER NOT NULL,
  regulation_id INTEGER,
  title VARCHAR(32),
  publication_date TIMESTAMP,
  status VARCHAR(32),
  effective_date DATE,
  hearing_date TIMESTAMP,
  federal_register_citation VARCHAR(32),
  tax_statute_id INTEGER,
  tax_deduction_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (tax_regulation_id),
  FOREIGN KEY (tax_statute_id) REFERENCES tax_statutes (tax_statute_id),
  FOREIGN KEY (tax_deduction_id) REFERENCES tax_deductions (tax_deduction_id)
);
