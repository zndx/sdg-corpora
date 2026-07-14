CREATE TABLE representatives_determinations (
  legal_representative_id INTEGER NOT NULL,
  best_interest_determination_id INTEGER NOT NULL,
  PRIMARY KEY (legal_representative_id, best_interest_determination_id),
  FOREIGN KEY (legal_representative_id) REFERENCES legal_representatives (legal_representative_id),
  FOREIGN KEY (best_interest_determination_id) REFERENCES best_interest_determinations (id)
);
