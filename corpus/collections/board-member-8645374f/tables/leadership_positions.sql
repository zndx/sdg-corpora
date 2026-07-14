CREATE TABLE leadership_positions (
  position_id VARCHAR(44) NOT NULL,
  position_title VARCHAR(32),
  sector VARCHAR(32),
  start_date DATE,
  end_date DATE,
  is_current BOOLEAN,
  person_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (position_id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id)
);
