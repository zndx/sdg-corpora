CREATE TABLE conference_marketplaces (
  id INTEGER NOT NULL,
  marketplace_id VARCHAR(44),
  booth_count INTEGER,
  setup_date DATE,
  dismantle_date DATE,
  status VARCHAR(32),
  major_event_id INTEGER,
  sponsoring_organization_org_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (major_event_id) REFERENCES major_events (id),
  FOREIGN KEY (sponsoring_organization_org_id) REFERENCES sponsoring_organizations (org_id)
);
