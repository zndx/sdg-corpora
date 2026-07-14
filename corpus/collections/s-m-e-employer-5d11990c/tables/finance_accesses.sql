CREATE TABLE finance_accesses (
  id INTEGER NOT NULL,
  access_status VARCHAR(32),
  finance_type VARCHAR(32),
  banking_sector_impact VARCHAR(32),
  amount_requested DECIMAL,
  amount_approved VARCHAR(32),
  s_m_e_employer_id INTEGER,
  survey_wave_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (s_m_e_employer_id) REFERENCES s_m_e_employers (id),
  FOREIGN KEY (survey_wave_id) REFERENCES survey_waves (id)
);
