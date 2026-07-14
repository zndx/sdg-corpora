CREATE TABLE jurisdictions_es (
  jurisdiction_id INTEGER NOT NULL,
  s_m_e_id INTEGER NOT NULL,
  PRIMARY KEY (jurisdiction_id, s_m_e_id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id),
  FOREIGN KEY (s_m_e_id) REFERENCES s_m_es (s_m_e_id)
);
