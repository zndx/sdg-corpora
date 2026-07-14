CREATE TABLE interventions (
  id INTEGER NOT NULL,
  intervention_identifier VARCHAR(32),
  intervention_type VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  restrictiveness_level VARCHAR(32),
  status VARCHAR(32),
  individual_id INTEGER,
  best_interest_determination_id INTEGER,
  decision_context_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id),
  FOREIGN KEY (best_interest_determination_id) REFERENCES best_interest_determinations (id),
  FOREIGN KEY (decision_context_id) REFERENCES decision_contexts (decision_context_id)
);
