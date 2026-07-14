CREATE TABLE professional_bodies (
  id INTEGER NOT NULL,
  body_name VARCHAR(32),
  founding_year INTEGER,
  membership_type VARCHAR(32),
  focus_area VARCHAR(32),
  legal_person_id INTEGER,
  legal_document_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (legal_person_id) REFERENCES legal_persons (legal_person_id),
  FOREIGN KEY (legal_document_id) REFERENCES legal_documents (legal_document_id)
);
