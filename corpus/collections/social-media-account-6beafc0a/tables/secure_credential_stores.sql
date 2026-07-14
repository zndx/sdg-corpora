CREATE TABLE secure_credential_stores (
  secure_credential_store_id INTEGER NOT NULL,
  store_identifier VARCHAR(32),
  access_level VARCHAR(32),
  last_accessed TIMESTAMP,
  is_encrypted BOOLEAN,
  social_media_account_id INTEGER,
  PRIMARY KEY (secure_credential_store_id),
  FOREIGN KEY (social_media_account_id) REFERENCES social_media_accounts (id)
);
