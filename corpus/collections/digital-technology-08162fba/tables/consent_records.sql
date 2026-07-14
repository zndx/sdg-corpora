CREATE TABLE consent_records (
  id INTEGER NOT NULL,
  consent_i_d VARCHAR(32),
  consent_date TIMESTAMP,
  consent_method VARCHAR(32),
  is_withdrawable BOOLEAN,
  withdrawal_date TIMESTAMP,
  individual_id INTEGER,
  privacy_policy_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (individual_id) REFERENCES individuals (id),
  FOREIGN KEY (privacy_policy_id) REFERENCES privacy_policies (id)
);
