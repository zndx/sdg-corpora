CREATE TABLE apprenticeship_schemes (
  scheme_id VARCHAR(44) NOT NULL,
  level VARCHAR(32),
  sector VARCHAR(32),
  duration_months INTEGER,
  status VARCHAR(32),
  framework_id VARCHAR(44),
  training_framework_id INTEGER,
  economic_sector_id INTEGER,
  funding_instrument_id INTEGER,
  PRIMARY KEY (scheme_id),
  FOREIGN KEY (training_framework_id) REFERENCES training_frameworks (id),
  FOREIGN KEY (economic_sector_id) REFERENCES economic_sectors (economic_sector_id),
  FOREIGN KEY (funding_instrument_id) REFERENCES funding_instruments (id)
);
