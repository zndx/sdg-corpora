CREATE TABLE land_owners (
  id INTEGER NOT NULL,
  owner_id VARCHAR(32),
  owner_name VARCHAR(32),
  owner_type VARCHAR(32),
  land_area_acres DECIMAL,
  lease_rate_per_year DECIMAL,
  lease_purpose_restriction VARCHAR(32),
  managing_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (managing_organization_id) REFERENCES managing_organizations (id)
);
