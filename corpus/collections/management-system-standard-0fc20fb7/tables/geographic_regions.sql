CREATE TABLE geographic_regions (
  id INTEGER NOT NULL,
  region_code VARCHAR(40),
  region_name VARCHAR(32),
  continent VARCHAR(32),
  organization_id INTEGER,
  certification_statistic_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (certification_statistic_id) REFERENCES certification_statistics (certification_statistic_id)
);
