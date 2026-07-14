CREATE TABLE immigration_documents (
  id INTEGER NOT NULL,
  document_id VARCHAR(44),
  form_code VARCHAR(38),
  issuing_agency VARCHAR(44),
  annotation VARCHAR(32),
  issue_date DATE,
  expiry_date DATE,
  document_type VARCHAR(32),
  immigration_status_declaration_id INTEGER,
  verification_consent_form_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (immigration_status_declaration_id) REFERENCES immigration_status_declarations (id),
  FOREIGN KEY (verification_consent_form_id) REFERENCES verification_consent_forms (id)
);
