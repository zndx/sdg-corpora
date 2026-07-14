CREATE TABLE determinations_interventions (
  best_interest_determination_id INTEGER NOT NULL,
  intervention_id INTEGER NOT NULL,
  PRIMARY KEY (best_interest_determination_id, intervention_id),
  FOREIGN KEY (best_interest_determination_id) REFERENCES best_interest_determinations (id),
  FOREIGN KEY (intervention_id) REFERENCES interventions (id)
);
