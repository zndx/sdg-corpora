CREATE TABLE corporate_sponsors (
  id INTEGER NOT NULL,
  company_name VARCHAR(32),
  company_type VARCHAR(57),
  headquarters_location VARCHAR(32),
  industry_sector VARCHAR(32),
  sponsorship_program_name VARCHAR(32),
  total_funding_distributed DECIMAL,
  grant_award_id INTEGER,
  water_harvesting_system_id INTEGER,
  community_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (grant_award_id) REFERENCES grant_awards (id),
  FOREIGN KEY (water_harvesting_system_id) REFERENCES water_harvesting_systems (water_harvesting_system_id),
  FOREIGN KEY (community_organization_id) REFERENCES community_organizations (id)
);
