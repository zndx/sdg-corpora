CREATE TABLE assessments_sheets (
  assessment_id INTEGER NOT NULL,
  score_sheet_id INTEGER NOT NULL,
  PRIMARY KEY (assessment_id, score_sheet_id),
  FOREIGN KEY (assessment_id) REFERENCES assessments (assessment_id),
  FOREIGN KEY (score_sheet_id) REFERENCES score_sheets (score_sheet_id)
);
