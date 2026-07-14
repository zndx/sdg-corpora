CREATE TABLE religious_organizations (
  religious_organization_id INTEGER NOT NULL,
  org_identifier VARCHAR(32),
  org_name VARCHAR(32),
  affiliation VARCHAR(32),
  founding_date TIMESTAMP,
  headquarters_location VARCHAR(32),
  is_political BOOLEAN,
  membership_count INTEGER,
  ideological_movement_id INTEGER,
  geopolitical_region_id INTEGER,
  individual_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (religious_organization_id),
  FOREIGN KEY (ideological_movement_id) REFERENCES ideological_movements (ideological_movement_id),
  FOREIGN KEY (geopolitical_region_id) REFERENCES geopolitical_regions (id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id)
);
