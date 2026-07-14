CREATE TABLE persons_assessments (
  person_id VARCHAR(32) NOT NULL,
  decision_assessment_id INTEGER NOT NULL,
  PRIMARY KEY (person_id, decision_assessment_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (decision_assessment_id) REFERENCES decision_assessments (id)
);
