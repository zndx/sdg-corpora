CREATE TABLE divisions_submissions (
  division_id VARCHAR(32) NOT NULL,
  budget_submission_id INTEGER NOT NULL,
  PRIMARY KEY (division_id, budget_submission_id),
  FOREIGN KEY (division_id) REFERENCES operating_divisions (division_id),
  FOREIGN KEY (budget_submission_id) REFERENCES budget_submissions (id)
);
