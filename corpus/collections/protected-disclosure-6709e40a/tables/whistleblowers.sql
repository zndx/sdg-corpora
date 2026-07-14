CREATE TABLE whistleblowers (
  whistleblower_id INTEGER NOT NULL,
  person_id VARCHAR(32),
  role VARCHAR(32),
  campus_affiliation VARCHAR(32),
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  protection_status VARCHAR(32),
  disclosure_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (whistleblower_id),
  FOREIGN KEY (disclosure_id) REFERENCES protected_disclosures (disclosure_id)
);
