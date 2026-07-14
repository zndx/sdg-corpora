CREATE TABLE economic_sectors (
  economic_sector_id INTEGER NOT NULL,
  sector_code INTEGER,
  sector_name VARCHAR(32),
  skill_shortage_level VARCHAR(32),
  apprenticeship_capacity INTEGER,
  scheme_id VARCHAR(44),
  gap_id VARCHAR(35),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (economic_sector_id),
  FOREIGN KEY (scheme_id) REFERENCES apprenticeship_schemes (scheme_id),
  FOREIGN KEY (gap_id) REFERENCES skill_gaps (gap_id)
);
