CREATE TABLE applicants (
  applicant_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  contact_info VARCHAR(32),
  representation_status VARCHAR(32),
  zoning_case_id INTEGER,
  representative_id INTEGER,
  PRIMARY KEY (applicant_id),
  FOREIGN KEY (zoning_case_id) REFERENCES zoning_cases (id),
  FOREIGN KEY (representative_id) REFERENCES representatives (id)
);
