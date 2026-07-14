CREATE TABLE documents_individuals (
  plan_document_id INTEGER NOT NULL,
  eligible_individual_id INTEGER NOT NULL,
  PRIMARY KEY (plan_document_id, eligible_individual_id),
  FOREIGN KEY (plan_document_id) REFERENCES plan_documents (id),
  FOREIGN KEY (eligible_individual_id) REFERENCES eligible_individuals (id)
);
