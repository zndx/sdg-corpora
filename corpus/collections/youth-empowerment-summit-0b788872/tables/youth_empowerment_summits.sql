CREATE TABLE youth_empowerment_summits (
  youth_empowerment_summit_id INTEGER NOT NULL,
  summit_identifier VARCHAR(32),
  edition_number INTEGER,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  total_attendance INTEGER,
  current_theme VARCHAR(32),
  educational_institution_id INTEGER,
  youth_organization_org_id VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (youth_empowerment_summit_id),
  FOREIGN KEY (educational_institution_id) REFERENCES educational_institutions (educational_institution_id),
  FOREIGN KEY (youth_organization_org_id) REFERENCES youth_organizations (org_id)
);
