CREATE TABLE estates (
  estate_id INTEGER NOT NULL,
  identifier VARCHAR(32),
  owner_name VARCHAR(32),
  total_value DECIMAL,
  currency_code VARCHAR(44),
  creation_date TIMESTAMP,
  status VARCHAR(32),
  beneficiary_designation_id INTEGER,
  joint_ownership_id INTEGER,
  will_id INTEGER,
  PRIMARY KEY (estate_id),
  FOREIGN KEY (beneficiary_designation_id) REFERENCES beneficiary_designations (id),
  FOREIGN KEY (joint_ownership_id) REFERENCES joint_ownerships (joint_ownership_id),
  FOREIGN KEY (will_id) REFERENCES wills (will_id)
);
