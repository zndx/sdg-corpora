CREATE TABLE business_owners (
  business_owner_id INTEGER NOT NULL,
  owner_id VARCHAR(32),
  full_name VARCHAR(36),
  generation VARCHAR(32),
  age INTEGER,
  title VARCHAR(32),
  years_of_experience INTEGER,
  exit_plan BOOLEAN,
  exit_timeframe INTEGER,
  s_m_e_id INTEGER,
  jurisdiction_id INTEGER,
  survey_id INTEGER,
  PRIMARY KEY (business_owner_id),
  FOREIGN KEY (s_m_e_id) REFERENCES s_m_es (s_m_e_id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id),
  FOREIGN KEY (survey_id) REFERENCES surveys (id)
);
