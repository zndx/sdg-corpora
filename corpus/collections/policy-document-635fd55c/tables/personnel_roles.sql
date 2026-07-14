CREATE TABLE personnel_roles (
  id INTEGER NOT NULL,
  role_type VARCHAR(32),
  department VARCHAR(32),
  clearance_level VARCHAR(32),
  start_date DATE,
  end_date DATE,
  is_active BOOLEAN,
  personnel_role_id INTEGER,
  policy_document_policy_number VARCHAR(32),
  subject_to_policy_document_policy_number VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (personnel_role_id) REFERENCES personnel_roles (id),
  FOREIGN KEY (policy_document_policy_number) REFERENCES policy_documents (policy_number),
  FOREIGN KEY (subject_to_policy_document_policy_number) REFERENCES policy_documents (policy_number)
);
