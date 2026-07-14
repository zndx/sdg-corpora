CREATE TABLE best_interest_determinations (
  id INTEGER NOT NULL,
  determination_identifier VARCHAR(32),
  determination_date TIMESTAMP,
  least_restrictive_option BOOLEAN,
  consultation_participants VARCHAR(32),
  outcome_description VARCHAR(32),
  review_date TIMESTAMP,
  individual_id INTEGER,
  decision_context_id INTEGER,
  legal_representative_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id),
  FOREIGN KEY (decision_context_id) REFERENCES decision_contexts (decision_context_id),
  FOREIGN KEY (legal_representative_id) REFERENCES legal_representatives (legal_representative_id)
);
