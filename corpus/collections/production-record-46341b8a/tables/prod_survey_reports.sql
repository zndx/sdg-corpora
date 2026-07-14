CREATE TABLE prod_survey_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  publisher VARCHAR(32),
  publication_date TIMESTAMP,
  report_type VARCHAR(32),
  period_covered VARCHAR(32),
  created_at TIMESTAMP,
  PRIMARY KEY (id)
);
