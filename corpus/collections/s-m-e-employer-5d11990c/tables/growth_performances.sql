CREATE TABLE growth_performances (
  growth_performance_id INTEGER NOT NULL,
  employment_change VARCHAR(32),
  turnover_change VARCHAR(32),
  measurement_period VARCHAR(32),
  growth_ambition VARCHAR(32),
  s_m_e_employer_id INTEGER,
  survey_wave_id INTEGER,
  PRIMARY KEY (growth_performance_id),
  FOREIGN KEY (s_m_e_employer_id) REFERENCES s_m_e_employers (id),
  FOREIGN KEY (survey_wave_id) REFERENCES survey_waves (id)
);
