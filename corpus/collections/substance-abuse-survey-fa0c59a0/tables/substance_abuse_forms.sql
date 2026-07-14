CREATE TABLE substance_abuse_forms (
  id INTEGER NOT NULL,
  form_code VARCHAR(38),
  form_name VARCHAR(32),
  prevalence_rate DECIMAL,
  risk_category VARCHAR(32),
  is_controlled_substance BOOLEAN,
  substance_abuse_survey_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (substance_abuse_survey_id) REFERENCES substance_abuse_surveys (id)
);
