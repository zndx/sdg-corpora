CREATE TABLE documents_obligations (
  plan_document_id INTEGER NOT NULL,
  compliance_obligation_id INTEGER NOT NULL,
  PRIMARY KEY (plan_document_id, compliance_obligation_id),
  FOREIGN KEY (plan_document_id) REFERENCES plan_documents (id),
  FOREIGN KEY (compliance_obligation_id) REFERENCES compliance_obligations (compliance_obligation_id)
);
