CREATE TABLE decision_contexts (
  decision_context_id INTEGER NOT NULL,
  context_identifier VARCHAR(32),
  decision_category VARCHAR(32),
  urgency_level VARCHAR(32),
  risk_level VARCHAR(32),
  description VARCHAR(32),
  capacity_assessment_id INTEGER,
  best_interest_determination_id INTEGER,
  PRIMARY KEY (decision_context_id),
  FOREIGN KEY (capacity_assessment_id) REFERENCES capacity_assessments (id),
  FOREIGN KEY (best_interest_determination_id) REFERENCES best_interest_determinations (id)
);
