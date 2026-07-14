CREATE TABLE policy_instruments (
  id INTEGER NOT NULL,
  instrument_id VARCHAR(32),
  instrument_name VARCHAR(32),
  issuing_body VARCHAR(32),
  target_sector VARCHAR(32),
  effective_date DATE,
  s_m_e_employer_id INTEGER,
  finance_access_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (s_m_e_employer_id) REFERENCES s_m_e_employers (id),
  FOREIGN KEY (finance_access_id) REFERENCES finance_accesses (id)
);
