CREATE TABLE organizations_persons (
  educational_organization_id INTEGER NOT NULL,
  person_id INTEGER NOT NULL,
  PRIMARY KEY (educational_organization_id, person_id),
  FOREIGN KEY (educational_organization_id) REFERENCES educational_organizations (educational_organization_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id)
);
