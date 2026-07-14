CREATE TABLE policy_documents (
  policy_document_id INTEGER NOT NULL,
  document_identifier VARCHAR(32),
  document_title VARCHAR(32),
  publication_date DATE,
  issuing_authority VARCHAR(32),
  compliance_standard VARCHAR(32),
  document_status VARCHAR(32),
  business_unit_id INTEGER,
  governance_body_id INTEGER,
  meeting_id INTEGER,
  PRIMARY KEY (policy_document_id),
  FOREIGN KEY (business_unit_id) REFERENCES business_units (id),
  FOREIGN KEY (governance_body_id) REFERENCES governance_bodies (id),
  FOREIGN KEY (meeting_id) REFERENCES meetings (id)
);
