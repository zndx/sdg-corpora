CREATE TABLE events (
  event_id VARCHAR(35) NOT NULL,
  event_name VARCHAR(32),
  event_type VARCHAR(39),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  location_region VARCHAR(41),
  is_funded BOOLEAN,
  partner_organization_id INTEGER,
  research_theme_id INTEGER,
  PRIMARY KEY (event_id),
  FOREIGN KEY (partner_organization_id) REFERENCES partner_organizations (partner_organization_id),
  FOREIGN KEY (research_theme_id) REFERENCES research_themes (id)
);
