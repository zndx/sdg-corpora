CREATE TABLE census_registrations (
  id INTEGER NOT NULL,
  has_registration_date DATE,
  has_registration_location VARCHAR(32),
  has_mandating_authority VARCHAR(32),
  has_purpose VARCHAR(32),
  government_decree_id INTEGER,
  human_person_id INTEGER,
  settlement_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (government_decree_id) REFERENCES government_decrees (id),
  FOREIGN KEY (human_person_id) REFERENCES human_persons (id),
  FOREIGN KEY (settlement_id) REFERENCES settlements (settlement_id)
);
