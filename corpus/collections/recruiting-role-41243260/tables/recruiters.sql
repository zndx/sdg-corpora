CREATE TABLE recruiters (
  recruiter_id INTEGER NOT NULL,
  specialization VARCHAR(32),
  employment_status VARCHAR(32),
  last_contact_date TIMESTAMP,
  connection_status VARCHAR(32),
  organization_id INTEGER,
  PRIMARY KEY (recruiter_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id)
);
