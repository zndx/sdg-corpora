CREATE TABLE partner_organizations (
  id INTEGER NOT NULL,
  partner_id VARCHAR(32),
  organization_name VARCHAR(32),
  organization_type VARCHAR(32),
  country VARCHAR(32),
  is_coordinator BOOLEAN,
  event_id INTEGER,
  partner_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (event_id) REFERENCES events (id),
  FOREIGN KEY (partner_organization_id) REFERENCES partner_organizations (id)
);
