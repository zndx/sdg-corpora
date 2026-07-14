CREATE TABLE state_associations (
  state_association_id INTEGER NOT NULL,
  association_id VARCHAR(35),
  association_name VARCHAR(32),
  state_code INTEGER,
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  black_belt_verification_id INTEGER,
  PRIMARY KEY (state_association_id),
  FOREIGN KEY (black_belt_verification_id) REFERENCES black_belt_verifications (id)
);
