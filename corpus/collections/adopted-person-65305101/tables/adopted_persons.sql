CREATE TABLE adopted_persons (
  id INTEGER NOT NULL,
  person_id VARCHAR(32),
  justification_date TIMESTAMP,
  adoption_status VARCHAR(32),
  spiritual_name VARCHAR(32),
  inheritance_status VARCHAR(32),
  redemption_day TIMESTAMP,
  adoption_spirit_id INTEGER,
  adoption_seal_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (adoption_spirit_id) REFERENCES adoption_spirits (id),
  FOREIGN KEY (adoption_seal_id) REFERENCES adoption_seals (adoption_seal_id)
);
