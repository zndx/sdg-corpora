CREATE TABLE organizations (
  id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  website VARCHAR(56),
  mission_statement VARCHAR(32),
  vision_statement VARCHAR(32),
  person_id INTEGER,
  has_council_member_person_id INTEGER,
  industry_sector_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (has_council_member_person_id) REFERENCES persons (person_id),
  FOREIGN KEY (industry_sector_id) REFERENCES industry_sectors (industry_sector_id)
);
