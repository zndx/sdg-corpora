CREATE TABLE individuals (
  id INTEGER NOT NULL,
  individual_i_d VARCHAR(32),
  name VARCHAR(34),
  date_of_birth DATE,
  nationality VARCHAR(32),
  gender VARCHAR(32),
  account_type VARCHAR(32),
  privacy_policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (privacy_policy_id) REFERENCES privacy_policies (id)
);
