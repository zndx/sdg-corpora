CREATE TABLE marketing_communications (
  id INTEGER NOT NULL,
  message_id VARCHAR(35),
  subject_line VARCHAR(32),
  sent_at TIMESTAMP,
  delivery_status VARCHAR(32),
  campaign_type VARCHAR(32),
  user_account_id INTEGER,
  data_processing_consent_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (user_account_id) REFERENCES user_accounts (user_account_id),
  FOREIGN KEY (data_processing_consent_id) REFERENCES data_processing_consents (id)
);
