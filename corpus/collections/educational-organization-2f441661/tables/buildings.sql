CREATE TABLE buildings (
  id INTEGER NOT NULL,
  building_id INTEGER,
  address VARCHAR(32),
  district VARCHAR(32),
  construction_year INTEGER,
  last_renovation_date DATE,
  lease_term_years INTEGER,
  lease_start_date DATE,
  lease_grantor VARCHAR(32),
  educational_organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (educational_organization_id) REFERENCES educational_organizations (educational_organization_id)
);
