CREATE TABLE partner_organizations (
  partner_organization_id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  org_type VARCHAR(32),
  country_code VARCHAR(44),
  is_coordinator BOOLEAN,
  is_originator BOOLEAN,
  coordinates_project_partner_organization_id INTEGER,
  event_id VARCHAR(35),
  country_id INTEGER,
  PRIMARY KEY (partner_organization_id),
  FOREIGN KEY (coordinates_project_partner_organization_id) REFERENCES partner_organizations (partner_organization_id),
  FOREIGN KEY (event_id) REFERENCES events (event_id),
  FOREIGN KEY (country_id) REFERENCES countries (country_id)
);
