CREATE TABLE sponsorship_packages (
  id INTEGER NOT NULL,
  package_id VARCHAR(32),
  package_name VARCHAR(32),
  tier_level VARCHAR(32),
  price DECIMAL,
  benefits_description VARCHAR(32),
  valid_from DATE,
  valid_until DATE,
  major_event_id INTEGER,
  sponsoring_organization_org_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (major_event_id) REFERENCES major_events (id),
  FOREIGN KEY (sponsoring_organization_org_id) REFERENCES sponsoring_organizations (org_id)
);
