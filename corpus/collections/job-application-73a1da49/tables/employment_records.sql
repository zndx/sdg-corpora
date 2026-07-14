CREATE TABLE employment_records (
  employment_record_id INTEGER NOT NULL,
  start_date DATE,
  end_date DATE,
  salary DECIMAL,
  position_title VARCHAR(32),
  reason_for_leaving VARCHAR(32),
  contact_permission VARCHAR(32),
  employer_name VARCHAR(36),
  employer_address VARCHAR(40),
  employer_phone VARCHAR(35),
  applicant_id INTEGER,
  organization_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (employment_record_id),
  FOREIGN KEY (applicant_id) REFERENCES applicants (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id)
);
