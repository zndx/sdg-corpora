CREATE TABLE individuals_determinations (
  individual_id INTEGER NOT NULL,
  best_interest_determination_id INTEGER NOT NULL,
  PRIMARY KEY (individual_id, best_interest_determination_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id),
  FOREIGN KEY (best_interest_determination_id) REFERENCES best_interest_determinations (id)
);
