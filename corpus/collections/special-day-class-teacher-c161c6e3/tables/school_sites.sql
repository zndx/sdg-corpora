CREATE TABLE school_sites (
  id INTEGER NOT NULL,
  site_id VARCHAR(32),
  site_name VARCHAR(32),
  district_affiliation VARCHAR(32),
  site_type VARCHAR(32),
  operational_status VARCHAR(32),
  capacity INTEGER,
  PRIMARY KEY (id)
);
