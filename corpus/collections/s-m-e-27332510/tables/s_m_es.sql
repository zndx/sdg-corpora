CREATE TABLE s_m_es (
  s_m_e_id INTEGER NOT NULL,
  enterprise_id VARCHAR(32),
  name VARCHAR(32),
  employee_count INTEGER,
  annual_revenue VARCHAR(32),
  sector VARCHAR(32),
  country_of_operation VARCHAR(32),
  is_publicly_traded BOOLEAN,
  founding_date DATE,
  market_sector_id INTEGER,
  jurisdiction_id INTEGER,
  business_owner_id INTEGER,
  PRIMARY KEY (s_m_e_id),
  FOREIGN KEY (market_sector_id) REFERENCES market_sectors (id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id),
  FOREIGN KEY (business_owner_id) REFERENCES business_owners (business_owner_id)
);
