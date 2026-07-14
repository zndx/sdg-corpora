CREATE TABLE professionals_determinations (
  professional_id INTEGER NOT NULL,
  best_interest_determination_id INTEGER NOT NULL,
  PRIMARY KEY (professional_id, best_interest_determination_id),
  FOREIGN KEY (professional_id) REFERENCES professionals (id),
  FOREIGN KEY (best_interest_determination_id) REFERENCES best_interest_determinations (id)
);
