CREATE TABLE surveys (
  id INTEGER NOT NULL,
  survey_id VARCHAR(44),
  title VARCHAR(32),
  commissioned_by VARCHAR(32),
  conducted_by VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  total_respondents INTEGER,
  countries_covered INTEGER,
  timeframe VARCHAR(32),
  PRIMARY KEY (id)
);
