CREATE TABLE customer_profiles (
  id INTEGER NOT NULL,
  profile_id VARCHAR(44),
  customer_name VARCHAR(32),
  household_id INTEGER,
  profile_status VARCHAR(32),
  last_updated TIMESTAMP,
  preference_tags VARCHAR(32),
  purchase_transaction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (purchase_transaction_id) REFERENCES purchase_transactions (id)
);
