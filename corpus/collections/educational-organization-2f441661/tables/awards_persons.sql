CREATE TABLE awards_persons (
  award_id INTEGER NOT NULL,
  person_id INTEGER NOT NULL,
  PRIMARY KEY (award_id, person_id),
  FOREIGN KEY (award_id) REFERENCES awards (award_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id)
);
