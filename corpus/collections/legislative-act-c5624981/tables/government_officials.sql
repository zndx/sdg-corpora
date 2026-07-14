CREATE TABLE government_officials (
  id INTEGER NOT NULL,
  official_name VARCHAR(32),
  designation VARCHAR(32),
  department VARCHAR(32),
  certification_date DATE,
  status VARCHAR(32),
  act_number VARCHAR(32),
  legislative_body_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (act_number) REFERENCES legislative_acts (act_number),
  FOREIGN KEY (legislative_body_id) REFERENCES legislative_bodies (id)
);
