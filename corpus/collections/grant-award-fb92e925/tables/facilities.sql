CREATE TABLE facilities (
  facility_id INTEGER NOT NULL,
  facility_name VARCHAR(32),
  facility_address VARCHAR(32),
  facility_type VARCHAR(32),
  construction_year INTEGER,
  roof_completion_date DATE,
  facility_status VARCHAR(32),
  community_organization_id INTEGER,
  water_harvesting_system_id INTEGER,
  municipality_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (facility_id),
  FOREIGN KEY (community_organization_id) REFERENCES community_organizations (id),
  FOREIGN KEY (water_harvesting_system_id) REFERENCES water_harvesting_systems (water_harvesting_system_id),
  FOREIGN KEY (municipality_id) REFERENCES municipalities (municipality_id)
);
