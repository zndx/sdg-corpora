CREATE TABLE control_centres (
  id INTEGER NOT NULL,
  centre_identifier VARCHAR(32),
  centre_name VARCHAR(32),
  jurisdiction VARCHAR(32),
  centre_type VARCHAR(32),
  established_date DATE,
  is_primary BOOLEAN,
  PRIMARY KEY (id)
);
