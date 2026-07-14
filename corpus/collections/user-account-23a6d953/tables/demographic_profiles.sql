CREATE TABLE demographic_profiles (
  id INTEGER NOT NULL,
  profile_id VARCHAR(44),
  zip_code VARCHAR(44),
  age_group VARCHAR(32),
  gender VARCHAR(32),
  primary_interest VARCHAR(32),
  favorite_category VARCHAR(32),
  is_anonymized BOOLEAN,
  user_account_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (user_account_id) REFERENCES user_accounts (id)
);
