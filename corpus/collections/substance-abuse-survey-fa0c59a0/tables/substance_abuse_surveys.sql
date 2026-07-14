CREATE TABLE substance_abuse_surveys (
  id INTEGER NOT NULL,
  survey_id VARCHAR(44),
  conducted_date TIMESTAMP,
  response_rate DECIMAL,
  total_counties_responded INTEGER,
  data_format VARCHAR(32),
  status VARCHAR(32),
  PRIMARY KEY (id)
);
