CREATE TABLE clinical_sites (
  id INTEGER NOT NULL,
  site_id VARCHAR(32),
  name VARCHAR(32),
  address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  country VARCHAR(32),
  principal_investigator VARCHAR(32),
  PRIMARY KEY (id)
);
