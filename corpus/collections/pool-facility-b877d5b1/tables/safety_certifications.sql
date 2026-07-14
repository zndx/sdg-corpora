CREATE TABLE safety_certifications (
  id INTEGER NOT NULL,
  cert_id INTEGER,
  cert_type VARCHAR(32),
  issuing_body VARCHAR(32),
  issue_date DATE,
  expiration_date DATE,
  is_current BOOLEAN,
  PRIMARY KEY (id)
);
