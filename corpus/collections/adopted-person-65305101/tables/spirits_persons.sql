CREATE TABLE spirits_persons (
  adoption_spirit_id INTEGER NOT NULL,
  adopted_person_id INTEGER NOT NULL,
  PRIMARY KEY (adoption_spirit_id, adopted_person_id),
  FOREIGN KEY (adoption_spirit_id) REFERENCES adoption_spirits (id),
  FOREIGN KEY (adopted_person_id) REFERENCES adopted_persons (id)
);
