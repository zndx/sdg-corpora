CREATE TABLE professionals_assessments (
  professional_id INTEGER NOT NULL,
  decision_assessment_id INTEGER NOT NULL,
  PRIMARY KEY (professional_id, decision_assessment_id),
  FOREIGN KEY (professional_id) REFERENCES professionals (id),
  FOREIGN KEY (decision_assessment_id) REFERENCES decision_assessments (id)
);
