CREATE TABLE documents_agencies (
  policy_document_policy_ref INTEGER NOT NULL,
  agency_id VARCHAR(39) NOT NULL,
  PRIMARY KEY (policy_document_policy_ref, agency_id),
  FOREIGN KEY (policy_document_policy_ref) REFERENCES policy_documents (policy_ref),
  FOREIGN KEY (agency_id) REFERENCES service_agencies (agency_id)
);
