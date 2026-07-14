CREATE TABLE assessments_competitors (
  assessment_id INTEGER NOT NULL,
  competitor_id INTEGER NOT NULL,
  PRIMARY KEY (assessment_id, competitor_id),
  FOREIGN KEY (assessment_id) REFERENCES assessments (assessment_id),
  FOREIGN KEY (competitor_id) REFERENCES competitors (competitor_id)
);
