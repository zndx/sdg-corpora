CREATE TABLE astronomical_surveys (
  astronomical_survey_id INTEGER NOT NULL,
  survey_id VARCHAR(44),
  survey_name VARCHAR(32),
  start_date DATE,
  end_date DATE,
  nights_allocated_per_year INTEGER,
  primary_objective VARCHAR(32),
  status VARCHAR(32),
  telescope_id INTEGER,
  funding_agency_id INTEGER,
  PRIMARY KEY (astronomical_survey_id),
  FOREIGN KEY (telescope_id) REFERENCES telescopes (id),
  FOREIGN KEY (funding_agency_id) REFERENCES funding_agencies (id)
);
