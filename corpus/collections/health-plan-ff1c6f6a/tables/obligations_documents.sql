CREATE TABLE obligations_documents (
  compliance_obligation_id INTEGER NOT NULL,
  plan_document_id INTEGER NOT NULL,
  PRIMARY KEY (compliance_obligation_id, plan_document_id),
  FOREIGN KEY (compliance_obligation_id) REFERENCES compliance_obligations (compliance_obligation_id),
  FOREIGN KEY (plan_document_id) REFERENCES plan_documents (id)
);
