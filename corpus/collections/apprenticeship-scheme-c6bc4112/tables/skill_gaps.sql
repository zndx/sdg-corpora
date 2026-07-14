CREATE TABLE skill_gaps (
  gap_id VARCHAR(35) NOT NULL,
  sector VARCHAR(32),
  occupation VARCHAR(32),
  severity VARCHAR(32),
  estimated_shortage INTEGER,
  reported_date DATE,
  economic_sector_id INTEGER,
  scheme_id VARCHAR(44),
  qualification_id VARCHAR(44),
  PRIMARY KEY (gap_id),
  FOREIGN KEY (economic_sector_id) REFERENCES economic_sectors (economic_sector_id),
  FOREIGN KEY (scheme_id) REFERENCES apprenticeship_schemes (scheme_id),
  FOREIGN KEY (qualification_id) REFERENCES qualifications (qualification_id)
);
