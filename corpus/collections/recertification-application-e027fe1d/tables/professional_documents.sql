CREATE TABLE professional_documents (
  document_id VARCHAR(44) NOT NULL,
  title VARCHAR(32),
  publication_date DATE,
  publisher VARCHAR(32),
  document_type VARCHAR(32),
  applies_to_body_of_knowledge BOOLEAN,
  claimed_once_per_period BOOLEAN,
  total_authors INTEGER,
  certified_professional_id INTEGER,
  activity_id VARCHAR(34),
  PRIMARY KEY (document_id),
  FOREIGN KEY (certified_professional_id) REFERENCES certified_professionals (certified_professional_id),
  FOREIGN KEY (activity_id) REFERENCES professional_activities (activity_id)
);
