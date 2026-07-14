CREATE TABLE service_inspections (
  id INTEGER NOT NULL,
  inspection_id VARCHAR(32),
  inspection_date TIMESTAMP,
  inspection_status VARCHAR(32),
  inspection_scope VARCHAR(32),
  findings_summary VARCHAR(32),
  policy_document_policy_ref INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (policy_document_policy_ref) REFERENCES policy_documents (policy_ref)
);
