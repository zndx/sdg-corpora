CREATE TABLE capacity_assessments (
  id INTEGER NOT NULL,
  assessment_identifier VARCHAR(32),
  assessment_date TIMESTAMP,
  decision_topic VARCHAR(32),
  assessor_role VARCHAR(32),
  outcome VARCHAR(32),
  support_provided BOOLEAN,
  individual_id INTEGER,
  decision_context_id INTEGER,
  best_interest_determination_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id),
  FOREIGN KEY (decision_context_id) REFERENCES decision_contexts (decision_context_id),
  FOREIGN KEY (best_interest_determination_id) REFERENCES best_interest_determinations (id)
);
