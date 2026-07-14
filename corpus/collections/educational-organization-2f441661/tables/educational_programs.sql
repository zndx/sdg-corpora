CREATE TABLE educational_programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  program_type VARCHAR(32),
  target_audience VARCHAR(32),
  is_draft_exempt BOOLEAN,
  enrollment_count INTEGER,
  educational_organization_id INTEGER,
  building_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (educational_organization_id) REFERENCES educational_organizations (educational_organization_id),
  FOREIGN KEY (building_id) REFERENCES buildings (id)
);
