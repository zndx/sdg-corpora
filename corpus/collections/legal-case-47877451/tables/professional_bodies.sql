CREATE TABLE professional_bodies (
  id INTEGER NOT NULL,
  body_id VARCHAR(32),
  name VARCHAR(32),
  founding_year INTEGER,
  jurisdiction VARCHAR(32),
  membership_type VARCHAR(32),
  legal_person_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (legal_person_id) REFERENCES legal_persons (legal_person_id)
);
