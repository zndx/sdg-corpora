CREATE TABLE credentials (
  credential_id VARCHAR(35) NOT NULL,
  credential_type VARCHAR(32),
  issuing_institution VARCHAR(32),
  issue_date DATE,
  status VARCHAR(32),
  admission_requirement_id INTEGER,
  PRIMARY KEY (credential_id),
  FOREIGN KEY (admission_requirement_id) REFERENCES admission_requirements (id)
);
