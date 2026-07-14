CREATE TABLE seals_persons (
  adoption_seal_id INTEGER NOT NULL,
  adopted_person_id INTEGER NOT NULL,
  PRIMARY KEY (adoption_seal_id, adopted_person_id),
  FOREIGN KEY (adoption_seal_id) REFERENCES adoption_seals (adoption_seal_id),
  FOREIGN KEY (adopted_person_id) REFERENCES adopted_persons (id)
);
