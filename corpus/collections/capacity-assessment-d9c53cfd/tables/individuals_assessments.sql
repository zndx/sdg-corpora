CREATE TABLE individuals_assessments (
  individual_id INTEGER NOT NULL,
  capacity_assessment_id INTEGER NOT NULL,
  PRIMARY KEY (individual_id, capacity_assessment_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id),
  FOREIGN KEY (capacity_assessment_id) REFERENCES capacity_assessments (id)
);
