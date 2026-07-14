CREATE TABLE policy_reviews (
  policy_review_id INTEGER NOT NULL,
  review_id VARCHAR(44),
  review_date TIMESTAMP,
  review_status VARCHAR(32),
  reviewer VARCHAR(32),
  findings VARCHAR(32),
  recommendations VARCHAR(32),
  person_id INTEGER,
  document_id VARCHAR(44),
  PRIMARY KEY (policy_review_id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (document_id) REFERENCES policy_documents (document_id)
);
