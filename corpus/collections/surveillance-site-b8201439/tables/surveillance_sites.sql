CREATE TABLE surveillance_sites (
  surveillance_site_id INTEGER NOT NULL,
  site_identifier VARCHAR(32),
  site_name VARCHAR(32),
  latitude DECIMAL,
  longitude DECIMAL,
  site_type VARCHAR(32),
  operational_status VARCHAR(32),
  deployment_date DATE,
  PRIMARY KEY (surveillance_site_id)
);
