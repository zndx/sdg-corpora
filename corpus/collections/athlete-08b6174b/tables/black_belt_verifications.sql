CREATE TABLE black_belt_verifications (
  id INTEGER NOT NULL,
  verification_id VARCHAR(44),
  verification_date TIMESTAMP,
  verification_method VARCHAR(32),
  is_verified BOOLEAN,
  issuing_organization VARCHAR(33),
  athlete_id INTEGER,
  state_association_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (athlete_id) REFERENCES athletes (id),
  FOREIGN KEY (state_association_id) REFERENCES state_associations (state_association_id)
);
