CREATE TABLE policy_documents (
  document_id VARCHAR(44) NOT NULL,
  title VARCHAR(32),
  version VARCHAR(32),
  effective_date DATE,
  expiry_date DATE,
  status VARCHAR(32),
  policy_review_id INTEGER,
  PRIMARY KEY (document_id),
  FOREIGN KEY (policy_review_id) REFERENCES policy_reviews (policy_review_id)
);
