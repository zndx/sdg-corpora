CREATE TABLE memberships (
  membership_id INTEGER NOT NULL,
  membership_type VARCHAR(32),
  registration_date TIMESTAMP,
  fee_amount DECIMAL,
  expiration_date DATE,
  is_eligible_for_competition BOOLEAN,
  athlete_id INTEGER,
  background_check_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (membership_id),
  FOREIGN KEY (athlete_id) REFERENCES athletes (id),
  FOREIGN KEY (background_check_id) REFERENCES background_checks (background_check_id)
);
