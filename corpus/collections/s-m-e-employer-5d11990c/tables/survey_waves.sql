CREATE TABLE survey_waves (
  id INTEGER NOT NULL,
  wave_id VARCHAR(32),
  survey_type VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  economic_period VARCHAR(32),
  sample_size INTEGER,
  s_m_e_employer_id INTEGER,
  research_agency_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (s_m_e_employer_id) REFERENCES s_m_e_employers (id),
  FOREIGN KEY (research_agency_id) REFERENCES research_agencies (id)
);
