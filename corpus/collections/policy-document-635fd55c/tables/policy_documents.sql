CREATE TABLE policy_documents (
  policy_number VARCHAR(32) NOT NULL,
  title VARCHAR(32),
  last_updated DATE,
  issued_by VARCHAR(32),
  approved_by VARCHAR(32),
  status VARCHAR(32),
  policy_document_policy_number VARCHAR(32),
  is_superseded_by_policy_document_policy_number VARCHAR(32),
  references_policy_document_policy_number VARCHAR(32),
  personnel_role_id INTEGER,
  PRIMARY KEY (policy_number),
  FOREIGN KEY (policy_document_policy_number) REFERENCES policy_documents (policy_number),
  FOREIGN KEY (is_superseded_by_policy_document_policy_number) REFERENCES policy_documents (policy_number),
  FOREIGN KEY (references_policy_document_policy_number) REFERENCES policy_documents (policy_number),
  FOREIGN KEY (personnel_role_id) REFERENCES personnel_roles (id)
);
