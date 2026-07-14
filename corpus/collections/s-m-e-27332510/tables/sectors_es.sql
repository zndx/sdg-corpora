CREATE TABLE sectors_es (
  market_sector_id INTEGER NOT NULL,
  s_m_e_id INTEGER NOT NULL,
  PRIMARY KEY (market_sector_id, s_m_e_id),
  FOREIGN KEY (market_sector_id) REFERENCES market_sectors (id),
  FOREIGN KEY (s_m_e_id) REFERENCES s_m_es (s_m_e_id)
);
