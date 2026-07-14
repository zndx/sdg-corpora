CREATE TABLE s_m_e_employers (
  id INTEGER NOT NULL,
  employer_id VARCHAR(61),
  employee_count INTEGER,
  commercial_sector VARCHAR(32),
  region VARCHAR(32),
  export_status BOOLEAN,
  training_commitment VARCHAR(32),
  survey_wave_id INTEGER,
  growth_performance_id INTEGER,
  finance_access_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (survey_wave_id) REFERENCES survey_waves (id),
  FOREIGN KEY (growth_performance_id) REFERENCES growth_performances (growth_performance_id),
  FOREIGN KEY (finance_access_id) REFERENCES finance_accesses (id)
);
