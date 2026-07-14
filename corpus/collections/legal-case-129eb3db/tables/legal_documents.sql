CREATE TABLE legal_documents (
  legal_document_id INTEGER NOT NULL,
  document_title VARCHAR(32),
  publication_date TIMESTAMP,
  publisher VARCHAR(32),
  document_type VARCHAR(32),
  co_author VARCHAR(32),
  legal_case_id INTEGER,
  legal_statute_id INTEGER,
  professional_body_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (legal_document_id),
  FOREIGN KEY (legal_case_id) REFERENCES legal_cases (legal_case_id),
  FOREIGN KEY (legal_statute_id) REFERENCES legal_statutes (id),
  FOREIGN KEY (professional_body_id) REFERENCES professional_bodies (id)
);
