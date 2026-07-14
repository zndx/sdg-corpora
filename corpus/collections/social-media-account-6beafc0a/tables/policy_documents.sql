CREATE TABLE policy_documents (
  id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  policy_number VARCHAR(32),
  title VARCHAR(32),
  effective_date DATE,
  version VARCHAR(32),
  electronic_communication_id INTEGER,
  social_media_account_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (electronic_communication_id) REFERENCES electronic_communications (electronic_communication_id),
  FOREIGN KEY (social_media_account_id) REFERENCES social_media_accounts (id)
);
