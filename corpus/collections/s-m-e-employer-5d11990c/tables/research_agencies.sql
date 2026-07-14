CREATE TABLE research_agencies (
  id INTEGER NOT NULL,
  agency_name VARCHAR(37),
  contract_id VARCHAR(32),
  survey_wave_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (survey_wave_id) REFERENCES survey_waves (id)
);
