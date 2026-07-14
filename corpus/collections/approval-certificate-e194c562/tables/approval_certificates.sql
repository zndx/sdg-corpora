CREATE TABLE approval_certificates (
  id INTEGER NOT NULL,
  approval_id INTEGER,
  approval_standard VARCHAR(32),
  approval_granted_date TIMESTAMP,
  date_authorized TIMESTAMP,
  revision_request VARCHAR(32),
  issuing_organization VARCHAR(33),
  issuing_officer VARCHAR(32),
  issuing_officer_title VARCHAR(32),
  manufacturer_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id)
);
