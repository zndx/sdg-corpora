CREATE TABLE inspection_reports (
  id INTEGER NOT NULL,
  report_number VARCHAR(32),
  issue_date TIMESTAMP,
  issuing_agency VARCHAR(44),
  docket_number VARCHAR(32),
  classification VARCHAR(32),
  adams_accession_number VARCHAR(32),
  licensee_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (licensee_id) REFERENCES licensees (id)
);
