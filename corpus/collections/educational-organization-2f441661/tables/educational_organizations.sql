CREATE TABLE educational_organizations (
  educational_organization_id INTEGER NOT NULL,
  organization_id VARCHAR(40),
  name VARCHAR(32),
  founding_date DATE,
  legal_status VARCHAR(32),
  tuition_policy VARCHAR(32),
  is_state_supported BOOLEAN,
  building_id INTEGER,
  educational_program_id INTEGER,
  PRIMARY KEY (educational_organization_id),
  FOREIGN KEY (building_id) REFERENCES buildings (id),
  FOREIGN KEY (educational_program_id) REFERENCES educational_programs (id)
);
