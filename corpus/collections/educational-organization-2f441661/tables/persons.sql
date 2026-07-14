CREATE TABLE persons (
  person_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  role VARCHAR(32),
  affiliation VARCHAR(32),
  email VARCHAR(32),
  is_draft_exempt BOOLEAN,
  educational_organization_id INTEGER,
  teaches_at_educational_organization_id INTEGER,
  government_body_id INTEGER,
  award_id INTEGER,
  PRIMARY KEY (person_id),
  FOREIGN KEY (educational_organization_id) REFERENCES educational_organizations (educational_organization_id),
  FOREIGN KEY (teaches_at_educational_organization_id) REFERENCES educational_organizations (educational_organization_id),
  FOREIGN KEY (government_body_id) REFERENCES government_bodies (id),
  FOREIGN KEY (award_id) REFERENCES awards (award_id)
);
