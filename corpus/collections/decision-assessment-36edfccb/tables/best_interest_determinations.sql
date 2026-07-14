CREATE TABLE best_interest_determinations (
  id INTEGER NOT NULL,
  determination_id VARCHAR(35),
  decision_date TIMESTAMP,
  chosen_option VARCHAR(32),
  restrictiveness_level VARCHAR(32),
  justification_text VARCHAR(32),
  status VARCHAR(32),
  person_id VARCHAR(32),
  topic_id VARCHAR(40),
  decision_assessment_id INTEGER,
  professional_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (topic_id) REFERENCES decision_topics (topic_id),
  FOREIGN KEY (decision_assessment_id) REFERENCES decision_assessments (id),
  FOREIGN KEY (professional_id) REFERENCES professionals (id)
);
