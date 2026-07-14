CREATE TABLE background_checks (
  background_check_id INTEGER NOT NULL,
  check_id VARCHAR(44),
  check_date TIMESTAMP,
  check_status VARCHAR(32),
  required_for_role VARCHAR(32),
  membership_id INTEGER,
  state_association_id INTEGER,
  PRIMARY KEY (background_check_id),
  FOREIGN KEY (membership_id) REFERENCES memberships (membership_id),
  FOREIGN KEY (state_association_id) REFERENCES state_associations (state_association_id)
);
