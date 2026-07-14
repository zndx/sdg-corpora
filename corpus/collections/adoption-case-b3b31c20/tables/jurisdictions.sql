CREATE TABLE jurisdictions (
  jurisdiction_id INTEGER NOT NULL,
  state_code INTEGER,
  state_name VARCHAR(32),
  court_system VARCHAR(32),
  PRIMARY KEY (jurisdiction_id)
);
